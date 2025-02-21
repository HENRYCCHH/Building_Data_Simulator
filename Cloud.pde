class Cloud{
  
  float tiles = 150;
  float tileSize = 1000/tiles;

  void show(int widthofProject, int heightofProject, PImage img){
    
    translate(widthofProject/2, heightofProject/8);
    rotateY(radians(frameCount/2));
    for (int x = 0; x < tiles; x++){
      for (int y = 0; y <tiles; y++){
        color c = img.get(int(x*tileSize),int(y*tileSize));
        fill(c);
        float b = map(brightness(c),0,255,0,1); // from 0 - 255 to 0 - 1
        
        
        float z =map(b,0,1,-150, 150);
        if (y%2==0){ z = -z;}
        
        push();
        translate(x*tileSize - widthofProject/4, y*tileSize- heightofProject/4 ,z);
        //ellipse(0,0,tileSize*b,tileSize*b);
        sphere(tileSize*b*0.9);
        pop();
      }
    }  
  }
  

  
}
