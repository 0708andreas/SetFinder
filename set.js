///////////////////////////
//--- Utility Section ---//
///////////////////////////

RED = DIAMOND = ONE = EMPTY = 0;
GREEN = OVAL = TWO = STRIPE = 1;
VIOLET = TILDE = THREE = FULL = 2;

let color_names = ["red", "green", "violet"];
let shape_names = ["diamond", "oval", "tilde"];
let fill_names = ["empty", "stripe", "full"];

function min(a, b) {
  if (a < b) return a;
  return b;
}
function max(a, b) {
  if (a > b) return a;
  return b;
}
function rotate(array, n) {
  n = n % array.length;
  return array.slice(n, array.length).concat(array.slice(0, n));
}
function array_equal(a, b) {
  return a.length == b.length && a.every((x, i) => x == b[i]);
}
function transpose(matrix) {
  // from https://stackoverflow.com/questions/17428587/transposing-a-2d-array-in-javascript
  return matrix[0].map((col, i) => matrix.map((row) => row[i]));
}
function permutations(array, size) {
  var results = [];
  function rec(p, i) {
    if (p.length == size) {
      results.push(p);
      return;
    }
    if (i + 1 > array.length) {
      return;
    }
    rec(p.concat([array[i]]), i + 1);
    rec(p, i + 1);
  }

  rec([], 0);
  return results;
}

function is_same_or_all_diff(t) {
  t.sort();
  return [
    [0, 0, 0],
    [1, 1, 1],
    [2, 2, 2],
    [0, 1, 2],
  ].some((a) => array_equal(a, t));
}

function is_set(cards) {
  return transpose(cards)
    .map(is_same_or_all_diff)
    .every((x) => x);
}

function find_sets(cards) {
  return permutations(cards, 3).filter(is_set);
}

///////////////////////////////////
// --- Business logic section ---//
///////////////////////////////////

num_cards = 9;

ref_colors = [
  [60, GREEN],
  [0, RED],
  [120, VIOLET],
];
ref_shapes = [
  [0.55, DIAMOND],
  [0.87, OVAL],
  [0.77, TILDE],
];
ref_fills = [
  [[1.0, 0.9], EMPTY],
  [[0.85, 0.5], STRIPE],
  [[0.3, 0.1], FULL],
];

function find_icons(img) {
  let gray = new cv.Mat();
  cv.cvtColor(img, gray, cv.COLOR_BGR2GRAY);

  let contrast = 64;
  let f = (131 * (contrast + 127)) / (127 * (131 - contrast));
  let alpha_c = f;
  let gamma_c = 127 * (1 - f);
  cv.addWeighted(gray, alpha_c, gray, 0, gamma_c, gray);

  let th = new cv.Mat();
  // cv.threshold(gray, th, 150, 255, cv.THRESH_BINARY + cv.THRESH_OTSU);
  cv.adaptiveThreshold(
    gray,
    th,
    255,
    cv.ADAPTIVE_THRESH_MEAN_C,
    cv.THRESH_BINARY,
    255,
    0,
  );

  let contours = new cv.MatVector();
  let hierarchy = new cv.Mat();
  cv.findContours(
    th,
    contours,
    hierarchy,
    cv.RETR_TREE,
    cv.CHAIN_APPROX_SIMPLE,
  );

  let cont_list = [];
  let largest_cont_ix = undefined;
  let largest_area = 0.0;
  for (let i = 0; i < contours.size(); i++) {
    cont_list.push(contours.get(i));
    if (cv.contourArea(contours.get(i), false) > largest_area) {
      largest_area = cv.contourArea(contours.get(i), false);
      largest_cont_ix = i;
    }
    let color = new cv.Scalar(
      Math.round(Math.random() * 255),
      Math.round(Math.random() * 255),
      Math.round(Math.random() * 255),
    );
    // cv.drawContours(img, contours, i, color, 1, cv.LINE_8, hierarchy, 100);
  }

  return cont_list.filter(
    (c, j) =>
      cv.contourArea(c, false) > 1000 &&
      hierarchy.intPtr(0, j)[3] == largest_cont_ix,
  );
}

function guess_count(img) {
  return find_icons(img).length - 1;
}

function mat2array(mat) {
  let result = [];
  for (let i = 0; i < mat.rows; i++) {
    result.push([]);
    for (let j = 0; j < mat.cols; j++) {
      result[i].push(mat.floatAt(i, j));
    }
  }
  return result;
}

function guess_color(img) {
  let hsv = new cv.Mat();
  cv.cvtColor(img, hsv, cv.COLOR_RGB2HSV);
  let crop_hsv = hsv.roi(new cv.Rect(20, 20, hsv.cols - 40, hsv.rows - 40));
  let _float32 = new cv.Mat();
  // let reshaped = crop_hsv.reshape(3, crop_hsv.rows * crop_hsv.cols);
  crop_hsv.convertTo(_float32, cv.CV_32F);
  let float32 = cv.matFromArray(
    crop_hsv.rows * crop_hsv.cols,
    3,
    cv.CV_32F,
    _float32.data32F,
  );
  // let float32 = new cv.Mat(crop_hsv.rows * crop_hsv.cols, 3, cv.CV_32F);
  // for (let y = 0; y < crop_hsv.rows; y++) {
  //   for (let x = 0; x < crop_hsv.cols; x++) {
  //     for (let z = 0; z < 3; z++) {
  //       float32.floatPtr(y + x * crop_hsv.rows)[z] = crop_hsv.ucharPtr(y, x)[z];
  //       // float32.data[(y + x * crop_hsv.rows) * float32.channels() + z] =
  //       // crop_hsv.ucharPtr(y, x)[z];
  //     }
  //   }
  // }

  let K = 2;
  let labels = new cv.Mat();
  let centers = new cv.Mat();
  let crit = new cv.TermCriteria(
    cv.TermCriteria_EPS + cv.TermCriteria_MAX_ITER,
    5,
    1.0,
  );
  cv.kmeans(float32, K, labels, crit, 5, cv.KMEANS_PP_CENTERS, centers);

  ref_white = [0, 0, 255];
  var non_white = undefined;
  if (
    [0, 1, 2]
      .map((i) => Math.abs(centers.floatAt(0, i) - ref_white[i]))
      .reduce((p, a) => p + a, 0) <
    [0, 1, 2]
      .map((i) => Math.abs(centers.floatAt(1, i) - ref_white[i]))
      .reduce((p, a) => p + a, 0)
  ) {
    non_white = [0, 1, 2].map((i) => centers.floatAt(1, i));
  } else {
    non_white = [0, 1, 2].map((i) => centers.floatAt(0, i));
  }

  let best_color = undefined;
  let score = Infinity;
  for (let i = 0; i < 3; i++) {
    if (Math.abs(non_white[0] - ref_colors[i][0]) < score) {
      best_color = ref_colors[i][1];
      score = Math.abs(non_white[0] - ref_colors[i][0]);
    }
  }

  return best_color;
}

function guess_shape(img) {
  conts = find_icons(img);
  rect = cv.minAreaRect(conts[0]);
  r_area = rect.size.width * rect.size.height;
  c_area = cv.contourArea(conts[0], false);
  ratio = c_area / r_area;

  let best_shape = undefined;
  let score = Infinity;
  for (let i = 0; i < ref_shapes.length; i++) {
    if (Math.abs(ref_shapes[i][0] - ratio) < score) {
      best_shape = ref_shapes[i][1];
      score = Math.abs(ref_shapes[i][0] - ratio);
    }
  }
  return best_shape;
}

function guess_fill(img) {
  let gray = new cv.Mat();
  cv.cvtColor(img, gray, cv.COLOR_RGB2GRAY);

  let contrast = 64;
  let f = (131 * (contrast + 127)) / (127 * (131 - contrast));
  let alpha_c = f;
  let gamma_c = 127 * (1 - f);
  cv.addWeighted(gray, alpha_c, gray, 0, gamma_c, gray);

  let cont = find_icons(img)[0];
  let rect = cv.boundingRect(cont);
  let [x, y, w, h] = [rect.x, rect.y, rect.width, rect.height];

  let line = [];
  for (let i = x; i < x + w; i++) {
    // for (let i = 0; i < img.cols; i++) {
    line.push(gray.ucharAt(Math.round(y + h / 2), i));
  }

  let minVal = line.reduce(min);
  line = line.map((a) => a - minVal);
  let maxVal = line.reduce(max);
  line = line.map((a) => a / maxVal);
  // console.log(line);

  span = [
    // line.slice(x + 10, x + w - 10).reduce(max),
    // line.slice(x + 10, x + w - 10).reduce(min),
    line.slice(100, 200).reduce(max),
    line.slice(100, 200).reduce(min),
  ];

  let best_fill = undefined;
  let score = Infinity;
  for (let i = 0; i < ref_fills.length; i++) {
    let new_score =
      Math.abs(span[0] - ref_fills[i][0][0]) +
      Math.abs(span[1] - ref_fills[i][0][1]);
    if (new_score < score) {
      best_fill = ref_fills[i][1];
      score = new_score;
    }
  }
  return best_fill;
}

var cards = [];

function imshow(img) {
  cv.imshow("canvasOutput", img);
}

function random_color() {
  let hsv = new cv.matFromArray(1, 1, cv.CV_8UC3, [
    Math.round(Math.random() * 255),
    255,
    255,
  ]);
  let rgb = new cv.Mat();
  cv.cvtColor(hsv, rgb, cv.COLOR_HSV2RGB);
  let val = rgb.ucharPtr(0, 0);
  return new cv.Scalar(val[0], val[1], val[2], 255);
}

function do_cv_magic() {
  num_cards = document.getElementById("numCardsInput").value;
  let mat = cv.imread(imgElement);
  cv.imshow("canvasOutput", mat);
  mat.delete();
  console.log(
    is_set([
      [1, 2, 0],
      [1, 1, 0],
      [1, 0, 0],
    ]),
  );

  var demo_cards = [
    [0, 1, 2],
    [0, 1, 1],
    [0, 1, 0],
    [1, 1, 2],
    [2, 1, 2],
  ];
  console.log(find_sets(demo_cards));

  img = cv.imread(imgElement);
  let gray = new cv.Mat();
  cv.cvtColor(img, gray, cv.COLOR_BGR2GRAY);
  let th = new cv.Mat();
  cv.threshold(gray, th, 100, 255, cv.THRESH_BINARY + cv.THRESH_OTSU);
  let contours = new cv.MatVector();
  let hierarchy = new cv.Mat();
  cv.findContours(
    th,
    contours,
    hierarchy,
    cv.RETR_TREE,
    cv.CHAIN_APPROX_SIMPLE,
  );
  console.log(
    "Found " +
      contours.size() +
      " contours. Taking only the " +
      num_cards +
      " largest",
  );
  let cont_list = [];
  for (var i = 0; i < contours.size(); i++) {
    cont_list.push(contours.get(i));
  }
  cont_list.sort((a, b) => cv.contourArea(b, false) - cv.contourArea(a, false));
  console.log(cont_list.map((a) => cv.contourArea(a, false)));
  cont_list = cont_list.slice(0, num_cards);
  console.log(cont_list.length);

  cards = [];
  let colors = [];
  let shapes = [];
  let counts = [];
  let fills = [];
  let vert_list = [];
  for (let i = 0; i < cont_list.length; i++) {
    let cont = cont_list[i];
    // let peri = cv.arcLength(cont, true);
    // let approx = new cv.Mat();
    // cv.approxPolyDP(cont, approx, 0.02 * peri, true);
    let rect = cv.minAreaRect(cont);
    let vertices = cv.RotatedRect.points(rect);
    let min_vert = vertices.map((a) => a.x + a.y).reduce(min);
    let min_vert_ix = vertices
      .map((a) => a.x + a.y)
      .findIndex((v) => v == min_vert);
    vertices = rotate(vertices, vertices.length - min_vert_ix);
    let red_color = new cv.Scalar(255, 0, 0);
    let source = [];
    for (let i = 0; i < 4; i++) {
      source.push(vertices[i].x);
      source.push(vertices[i].y);
      // cv.line(
      //   img,
      //   vertices[i],
      //   vertices[(i + 1) % 4],
      //   red_color,
      //   2,
      //   cv.LINE_AA,
      //   0,
      // );
    }

    source = cv.matFromArray(4, 1, cv.CV_32FC2, source);
    target = cv.matFromArray(
      4,
      1,
      cv.CV_32FC2,
      [0, 0, 449, 0, 449, 449, 0, 449],
      // [0, 0, 0, 499, 449, 0, 449, 449],
      // [0, 449, 0, 0, 449, 0, 449, 499],
    );
    let transform = cv.getPerspectiveTransform(source, target);
    warp = new cv.Mat();
    cv.warpPerspective(
      img,
      warp,
      transform,
      new cv.Size(450, 450),
      cv.INTER_LINEAR,
      cv.BORDER_CONSTANT,
      // new cv.Scalar(),
    );
    counts.push(guess_count(warp));
    colors.push(guess_color(warp));
    shapes.push(guess_shape(warp));
    fills.push(guess_fill(warp));
    vert_list.push(vertices);

    // cv.putText(
    //   img,
    //   "Rect " + i,
    //   cv.Point(rect.x, rect.y),
    //   cv.FONT_HERSHEY_COMPLEX,
    //   1.0,
    //   red_color,
    // );
    cards.push(warp);
    if (i == 0) {
      cv.imshow("canvasOutput", warp);
    }
  }
  console.log(counts.map((i) => i + 1));
  console.log(colors.map((i) => color_names[i]));
  console.log(shapes.map((i) => shape_names[i]));
  console.log(fills.map((i) => fill_names[i]));

  let sets = find_sets(transpose([counts, colors, shapes, fills]));
  for (let j = 0; j < sets.length; j++) {
    let color = random_color();
    // let color = new cv.Scalar(
    //   Math.round(Math.random() * 255),
    //   Math.round(Math.random() * 255),
    //   Math.round(Math.random() * 255),
    //   255,
    // );
    // let color = new cv.Scalar(0, 255, 0);
    let set = sets[j];
    for (let k = 0; k < set.length; k++) {
      let card = set[k];
      for (let i = 0; i < num_cards; i++) {
        if (array_equal(card, [counts[i], colors[i], shapes[i], fills[i]])) {
          // console.log("Card nr. " + i + " is part of set nr. " + j);
          let vertices = vert_list[i];
          for (let i = 0; i < 4; i++) {
            cv.line(
              img,
              vertices[i],
              vertices[(i + 1) % 4],
              color,
              sets.length - j,
              cv.LINE_AA,
              0,
            );
          }
        }
      }
    }
  }
  // console.log(find_sets(transpose([counts, colors, shapes, fills])));
  imshow(img);
}
