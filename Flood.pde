class Flood{
  int x = 1000;
  int y = 0;
  int z = 600;

  void show(float rainGauge){
     y = int(rainGauge);
     if (y == 0){
       fill(164, 244, 252,0);
     }
     else{
       fill(164, 244, 252,80);
     }  
     box(x,y,z);
  }
  

}
