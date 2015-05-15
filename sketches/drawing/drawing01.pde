
// execute once at startup (SETUP the program)
void setup() {
  // (width, height) in pixels
  size(400, 400);
}

// execute each frame (DRAW each frame)
void draw() {
  // draw a line from the center to the current mouse position
  line(0,0,mouseX,mouseY);
}

/*
EXERCISE : 
1. create three variations of this program. 
 - Hint : try line(200,mouseX,mouseX,mouseY); 
*/
