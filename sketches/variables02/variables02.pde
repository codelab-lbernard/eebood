//define and assign two integer variables
float x = 0;
float grayScaleVal = 127;

void setup(){
 size(400,400); 
}

void draw(){
 stroke(grayScaleVal);
 line(x,0,x,height);
 
 x += 0.5; 
 grayScaleVal += random(-2,2);
 grayScaleVal = constrain(grayScaleVal,0,255);
}

/*
EXERCISE: 
1. can you merge together two lines of this program and get the same result ?
2. extend the program so that is uses RGB color.
*/
