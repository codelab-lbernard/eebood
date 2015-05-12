
void setup(){
  size(400,400);  
}

void draw(){
  background(0);
  
  int n = 20;
  for(float x = n ; x < width ; x+=n){
    for(float y = n ; y < height ; y+=n){
        float size = dist(x,y,mouseX,mouseY)*0.1;
        ellipse(x,y,size,size);
    }
  }  
}

