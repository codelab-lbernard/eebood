int sz = 3;
int[][] data = { {0,0,0,0,0, 0, 0,0,0,0,0, 0, 1,0,0,0,0, 0, 0,0,0,0,0, 0, 0,0,0,0,0, 0, 0,0,0,0,1},
                 {0,0,0,0,0, 0, 0,0,0,0,0, 0, 1,0,0,0,0, 0, 0,0,0,0,0, 0, 0,0,0,0,0, 0, 0,0,0,0,1},
                 {1,1,1,1,1, 0, 1,1,1,1,1, 0, 1,1,1,1,1, 0, 1,1,1,1,1, 0, 1,1,1,1,1, 0, 1,1,1,1,1},
                 {1,0,0,0,1, 0, 1,0,0,0,1, 0, 1,0,0,0,1, 0, 1,0,0,0,1, 0, 1,0,0,0,1, 0, 1,0,0,0,1},
                 {1,0,1,1,1, 0, 1,0,1,1,1, 0, 1,0,0,0,1, 0, 1,0,0,0,1, 0, 1,0,0,0,1, 0, 1,0,0,0,1},
                 {1,0,0,0,0, 0, 1,0,0,0,0, 0, 1,0,0,0,1, 0, 1,0,0,0,1, 0, 1,0,0,0,1, 0, 1,0,0,0,1},
                 {1,1,1,1,1, 0, 1,1,1,1,1, 0, 1,1,1,1,1, 0, 1,1,1,1,1, 0, 1,1,1,1,1, 0, 1,1,1,1,1}};

int[][] datacopy = new int[7][35];

int timer = 0;

void setup(){
   size(35*sz,7*sz);
   frameRate(12);
   noStroke();
   fill(255);
   copyArray(data,datacopy);
}

void draw(){
  background(32);
  for(int y = 0 ; y < 7 ; y ++){
    for(int x = 0 ; x < 35 ; x ++){
      if(data[y][x] == 1){
       rect(x*sz,y*sz,sz,sz); 
       if(random(100)>99.9 && timer>50){mutateData(x,y);}
      }
    }
  }
  
  timer++;
}

void mutateData(int x, int y){
  int dat = data[y][x];
  int newx = x;
  int newy = y;
  
   if(random(100) > 50 && newx < 34){
    newx += 1; 
   }else if(newx > 0){
    newx -=1; 
   }
   
   if(random(100) > 50 && newy < 6){
    newy += 1; 
   }else if(newy > 0){
    newy -=1; 
   }
 
 data[y][x] = data[newy][newx];
 data[newy][newx] = dat;
 
}

void mouseMoved(){
 copyArray(datacopy,data);
 timer = 0;
}

void copyArray(int[][] src,int[][] dst){
  for(int y = 0 ; y < 7 ; y ++){
    for(int x = 0 ; x < 35 ; x ++){
       dst[y][x] = src[y][x];
    }
  }
}