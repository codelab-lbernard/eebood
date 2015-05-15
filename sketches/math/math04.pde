int x = 0; 
float num = 0;
float angle = 0;
float speed = 0.05;
float radius = 100;

void setup(){
  size(800,400);
  noFill();
}

void draw(){
  background(255);
  stroke(0);
  speed = mouseX *0.0005;
  
  //draw the unit circle
  ellipse(200,200,radius*2,radius*2);
  
  float circumX = 200+ sin(angle)*radius;
  float circumY = 200+ cos(angle)*radius;
  angle+=speed;
  if(angle >= TWO_PI){angle = 0;}
  
  //draw the radius
  line(200,200,circumX,circumY);
 
  // draw the cosine waves
  for(int i = 0 ; i < 400; i+=4){
    line(300+i,200 + cos(angle - speed*i)*radius, 300+i,200);
  }
  // draw the guidelines  
  stroke(0,64);
  line(circumX, circumY, 300, circumY);
  line(200, 200, circumX, 200);
  line(circumX, circumY, circumX, 200);
  
}
