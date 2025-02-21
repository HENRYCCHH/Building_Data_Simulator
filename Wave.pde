PShape createWavySurface(int cols, int rows, float w, float l, float h, float startYm, float rained, float time) {
  PShape wavySurface = createShape();
  wavySurface.beginShape(QUAD_STRIP);
  if (rained ==0){
    fill(164, 244, 252,0); 
  }  
  else {  
    fill(164, 244, 252,128);
  }
  float dx = w / cols;
  float dz = l / rows;
  
  for (int z = 0; z < rows; z++) {
    for (int x = 0; x <= cols; x++) {
      float xpos = x * dx - w / 2;
      float zpos = z * dz - l / 2;
      float ypos = map(noise(x * 0.1, z * 0.1, time), 0, 1, startYm - h / 2, startYm + h / 2); // noise for wave effect
      
      wavySurface.vertex(xpos, ypos, zpos);
      
      ypos = map(noise(x * 0.1, (z + 1) * 0.1, time), 0, 1, startYm - h / 2, startYm + h / 2);
      
      wavySurface.vertex(xpos, ypos, zpos + dz);
    }
  }
  
  wavySurface.endShape();
  
  return wavySurface;
}
