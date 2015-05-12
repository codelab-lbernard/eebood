

void setup() {
  size(400, 400);
}

void draw() {
    stroke(0);
    strokeWeight(dist(mouseX,mouseY,pmouseX,pmouseY)/3);
    line(mouseX, mouseY, pmouseX, pmouseY);
    
    noStroke();
    fill(255,4);
    rect(0,0,width,height);
}

/*
EXERCISE : 
1. determine strokeWeight using three other simple mathematical formulas.
 - FOR INSTANCE : using an avarage of x and y values : 
 strokeWeight(mouseX*mouseY/500);
*/
