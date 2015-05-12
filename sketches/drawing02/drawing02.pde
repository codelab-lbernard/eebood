
void setup() {
  size(400,400);
}

void draw() {
    // draw a line from current mouse position to previous mouse position
    line(mouseX, mouseY, pmouseX, pmouseY);
}



