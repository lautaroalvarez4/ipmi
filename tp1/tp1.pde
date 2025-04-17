
PImage img;

void setup (){
size (800, 400);

img= loadImage ("vasoTp1.jpg");


}

void draw (){
background (255);

image (img ,10, 40);

strokeWeight (2);
line (400 , 0 , 400 , 400);

fill(0);
rect(566,139,25,8,10);

fill(150);
rect(575,103,5,37,10);

fill(0);
rect (540,144, 75, 126, 10);

fill(150);
rect(540,153,75,10);

fill(0);
triangle(544,270,570,270,557,285);

triangle(612,268,580,270,599,285);

rect(550,268,57,80,10);

rect(615,164,35,8,20);
rect(615,250,35,8,20);
rect(640,165,12,93,20);

fill(50);
quad (540, 265, 550, 278, 606, 278, 615,265  );
rect(635, 176, 6,76, 10);
rect(616,172,25,6,10);

println (mouseX , mouseY);


}
