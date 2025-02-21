class Drop{
  float x = random(width/4)+width/2;
  float y = random(40, 350);
  float ySpeed = random(4, 10);
  float len = random(2, 20);
  float z = random (-100, 100);
  float z_depth = random (2,8);
  
  
  void fall(){
    y = y + ySpeed;
    ySpeed = ySpeed + 0.15;
    if ( y > height){
      y = random(100, 200);
      ySpeed = random(4, 10);
    }  
  }
  
  
  void show(){
   fill(random(200, 250), 250);
   push();
   translate(x -width/8, y, z);
   //box ( 6,len,z_depth); 
   sphere(5);
   pop();
  }
}
