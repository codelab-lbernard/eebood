
float x,y,radius, dirx,diry;

void setup() {
  size(640, 480);
  
  radius = 8;
  x = random(width);
  y = random(height);
  dirx = 3;
  diry = 3;
}

void draw() {

  x += dirx;
  y += diry;
  
  if(x >= width-radius || x <= radius){
   dirx *= -random(.9,1.1); 
    ellipse(x,y, radius*4, radius*4);
  }
  if(y >= height-radius || y <= radius){
   diry *= -random(.9,1.1); 
    ellipse(x,y, radius*4, radius*4);
  }
  
  ellipse(x,y, radius*2, radius*2);
}

/*
EXERCISE : 
1. create 3 variants to this program. play with different speeds, changin radius etc.  
*/
