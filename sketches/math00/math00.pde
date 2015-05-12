float radius = 10;

void setup() {
  size(400, 400);
  noFill();
  frameRate(12);
  strokeCap(SQUARE);
}

void draw() {
  strokeWeight(random(20));
  stroke(random(255));
  float startAng = random(0,TWO_PI);
  float endAng = random(startAng,startAng+PI/2);
  radius += random(1,10);
  
  arc(width/2,height/2,radius, radius ,startAng,endAng);
  
  if(radius > width){
   background(random(255));
   radius = 10;
  }
}
