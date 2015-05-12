

void setup() {
  size(400, 400);
  noFill();
  strokeCap(SQUARE);
  smooth(8);
}

void draw() {
  background(255);
  translate(width/2,height/2);
  rotate(-PI/2);
  // seconds
  strokeWeight(1);
  line(0,0, cos(second()/60.0*TWO_PI)*100 ,sin(second()/60.0*TWO_PI)*100 );
  //minutes
  strokeWeight(4);
  line(0,0, cos(minute()/60.0*TWO_PI)*80 ,sin(minute()/60.0*TWO_PI)*80 );
  //hours
  strokeWeight(8);
  line(0,0, cos(hour()/12.0*TWO_PI)*60 ,sin(hour()/12.0*TWO_PI)*60 );
  
}
