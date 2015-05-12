
// define a variable named "x"
int x = 0;

void setup() {
  size(400, 400);
}

void draw() {
  // if x is a multiple of 3
  if(x % 3 == 0){
    //draw a vertical line using mouse coordinates
    line(x,mouseX,x,mouseY);
  }
  
  // advance x by 1
  x = x + 1;
  
  // if x goes out of the screen
  if(x == width){
   // make x be 0 again
   x = 0;
   //  and choose new a random color
   stroke(random(255),random(255),random(255));
  }
  
}

/*
EXERCISE : 
1. change the gaps between lines
2. change the gaps each time x resets
3. make the program draw from top to bottom
*/
