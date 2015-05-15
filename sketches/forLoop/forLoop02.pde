
void setup(){
  size(400,400); 
}
   
void draw(){
  for(int i = 0 ; i < 40 ; i++){ 
   rect(mouseX*i/40, mouseY*i/40, width - 10*i, height - 10*i); 
  }  
}

