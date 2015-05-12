

void setup() {
  size(400, 400);
  noFill();
  strokeCap(SQUARE);
  smooth(8);
}

void draw() {
  background(255);
  translate(width/2,height/2);
  rotate(PI);
  // seconds
  pushMatrix();
  strokeWeight(1);
  rotate(second()/60.0 * TWO_PI);
  line(0,100,0,0);
  popMatrix();
  //minutes
  pushMatrix();
  strokeWeight(3);
  rotate(minute()/60.0 * TWO_PI);
  line(0,70,0,0);
  popMatrix();
  //hours
  pushMatrix();
  strokeWeight(6);
  rotate(hour()/12.0 * TWO_PI);
  line(0,40,0,0);
  popMatrix();
  
  // draw the 12 slots
  for(int i = 0 ; i < 12 ; i++){
    pushMatrix();
    strokeWeight(2);
    rotate(i/12.0 * TWO_PI);
    line(0,120,0,140);
    popMatrix();
  }
  
  for(int i = 0 ; i < 60 ; i++){
    pushMatrix();
    strokeWeight(.5);
    rotate(i/60.0 * TWO_PI);
    line(0,132,0,140);
    popMatrix();
  }
}
