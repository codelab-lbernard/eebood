
size(400,400);   
// loop 40 times using i as a counter
for(int i = 0 ; i < 40 ; i++){ 
  // draw a rectangle with corresponding position and size
  rect(i*5, i*5, width-10*i, height-10*i);  
}
