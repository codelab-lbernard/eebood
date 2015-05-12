
void setup() {
  size(400, 400);
  // draw rectangle from the conter, rather than top left corner.
  rectMode(CENTER);
}

void draw() {
  background(200);
  
  // "IS THE CURRENT MOUSE POSITION LARGER THAN HALF OF THE CANVAS WIDTH ?"  
  if(mouseX > width/2){
     //condition eauals true - draw rectangle
     rect(mouseX,mouseY, 40, 40);   
  }else{
    //condition eauals false - draw ellipse
     ellipse(mouseX,mouseY, 40, 40);
  }
  
  // draw a line in the middle of the canvas
  line(width/2,0,width/2,height);
  
}

/*
EXERCISE : 
1. change the condition so that it is based on the vertical axis
2. make the program choose between 4 different areas 
 and draw 4 different shapes accordingly. 
*/

