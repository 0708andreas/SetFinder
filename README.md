# SetFinder

Demo: [https://0708andreas.github.io/SetFinder/]

Dette er en web-app, der kan detektere, om der er et set i spillet [Set](https://www.setgame.com/sites/default/files/instructions/SET%20INSTRUCTIONS%20-%20DANISH.pdf).

Appen er baseret på [OpenCV.js](https://docs.opencv.org/4.x/d5/d10/tutorial_js_root.html)
og kan køre i alle moderne browsere.

# A hva' for en fisk?
Set er et kort-spil, der handler om at finde stik. På et bord lægger man 12 kort som her: ![12 kort fra spillet Set](./test12.jpg). Hvert kort har fire egenskaber: antal, form, farve og udfyldning. Et stik består af tre kort, hvor hver egenskab enten er ens på alle tre kort, eller forskellig på alle tre kort. Et eksempel på et stik er her:
![12 kort fra spillet set hvor et stik er fremhævet](./test12_stik.jpg)
Alle tre kort er røde og helt udfyldt, og de tre kort har forskellige antal og forskellige former.

Dette her er ikke et stik:
![12 kort fra spillet set hvor tre kort, der ikke danner et stik er fremhævet](./test12_ikke_stik.jpg)
