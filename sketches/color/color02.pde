int x = 0;

void setup() {
  size(400, 400);
  colorMode(HSB,400);
}

void draw() {
  // hue, saturation, brightness 
  stroke(mouseX,mouseY,x);
  line(x,0,x,height);
  
  x++;
  
  if(x == width || x == 0){
    x = 0;
  }
}

/*
EXERCISE : 
1. create a nice 4 color scheme.
2. draw a gradient with 10 degrees of fading
*/
