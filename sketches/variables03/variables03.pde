//define and assign two integer variables
float x = 0;
float grayScaleVal = 127;
float incTop = 0;
float incBottom = 0;

void setup(){
 size(400,400);
 strokeWeight(3);
 smooth(6);
}

void draw(){
 stroke(grayScaleVal);
 line(x+incTop,0,x+incBottom,height);
 
 x += 0.5; 
 incTop += random(-2,2);
 incBottom += random(-2,2);
 grayScaleVal += random(-10,10);
 grayScaleVal = constrain(grayScaleVal,0,255);
}

/*
EXERCISE: 
1. can you merge together two lines of this program and get the same result ?
2. extend the program so that is uses RGB color.
*/
