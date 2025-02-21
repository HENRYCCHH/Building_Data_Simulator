import processing.sound.*;

public class RainManager {
  //cloud & rain & flooding variables
  PImage img;
  
  Drop [] drops = new Drop[200];
  Cloud cloudOne = new Cloud();
  Flood flooding = new Flood();
  
  float rainAmount;
  float rainAmountAdjusted;
  float currentRain = 0;
  
  float totalRain;
  float totalRainAdjusted;
  float currentWaterLevel = 0;
  
  // waves components
  PShape wavySurface;
  int cols = 100; // Number of columns for the waves
  int rows = 60; // Number of rows for the waves
  float w ; // Width of the object (calculated based on canvas size)
  float l ; // Length of the object (calculated based on canvas size)
  float h = 50; // Height of the waves
  float[][] vertices;
  float time = 0.0; // A variable to control the movement of the waves
  float startY; // Y-coordinate for the top of the waves
  
  int opacity = 0;
  
  //dragging
  public PMatrix3D q;
  public int scroll = 500;
  public PVector rot = new PVector (0,0,0);
  
  //Sound for raining
  SoundFile[] sound;
  int numsounds = 15;
  float soundGain ;
  int startNote = 0;
  int playNote = 0;
  int counter = 0;
  int playbackRate = 50;
  
  public RainManager(Assignment2 ass2){
    img= loadImage("cloud.png");
    img.resize(width/2,height/2);
    
    for (int i = 0; i < drops.length; i++){
      drops[i] = new Drop();
    }  
    w = width;
    l = height;
    startY = height;
    
    
    //sound file for raining
    sound = new SoundFile[numsounds];
  
    for (int i = 0; i < numsounds; i++) {
      sound[i] = new SoundFile(ass2, (i+1) + ".wav");
    }
  }
  
  public float updateRain(int dayNumber){
    //rain
    rainAmount = float(dataManager.rainTable.getString(timeIndex, dayNumber));
    rainAmountAdjusted = map(rainAmount, 0, 2,0, 200);
    //flood
    totalRain = float(dataManager.totalRainTable.getString(timeIndex, dayNumber));
    totalRainAdjusted = map(totalRain, 0, 25,0, 200);
    
    
    fill(0);
    noStroke();
    sphereDetail(3);

    
    push();
    //cloud
    cloudOne.show(width, height, img);

   
    //rain and sound effect
    fill(255);
    translate(-width/2, -height/4);
    if (currentRain < rainAmountAdjusted){ 
        currentRain++;
        if (soundGain <0.9){
            soundGain +=0.01;
            if (playbackRate > 4){
            playbackRate--;
            }  
            
        }
        if (startNote  !=10){
           startNote  +=5;
        }
        else {
           startNote  = 0;
        }      
    }
    if (currentRain > rainAmountAdjusted){ 
      currentRain--;
      if (soundGain >0.15){
          soundGain -=0.01;
          if (playbackRate < 15){
            playbackRate++;
          }  
      }
      if (startNote  !=10){
         startNote  +=5;
      }
      else {
         startNote  = 0;
      }   
    } 
    
    if (totalRain == 0){
       soundGain =0;
    }  
    
    if (totalRain >0 && currentRain ==0){
      soundGain = 0.1;
      playbackRate = 50;
    }
    counter++;
    if (counter%playbackRate ==0){
      playNote = int(random(startNote, startNote + 4));
      sound[playNote].play(1, soundGain);
    }  
      
    
    for (int i = 0; i < currentRain ; i++){
      drops[i].fall();
      drops[i].show();
    }  
    
    
    pop();
    return rainAmount;
  }
  
  
  
  public float flood(){
    //Flood 
    push();
    translate(width/2, height, 0);
    if (currentWaterLevel < totalRainAdjusted) {currentWaterLevel++;}
    if (currentWaterLevel > totalRainAdjusted) {currentWaterLevel--;} 
    flooding.show(currentWaterLevel*2);
    pop();
    return totalRain;
  }
  
  public void wave(){
    //Wave  
    push();
    fill(164, 244, 252,128);
    translate(width/2, 0,0);
      // Update time to create the appearance of movement
    time += 0.02;
    if (totalRainAdjusted ==0){
       if (opacity > 0){
         opacity--;
       }  
       fill(164, 244, 252,opacity);
    }
    else{
       if (opacity <100){
         opacity ++;
       }
       fill(164, 244, 252,opacity);
    } 
      
    
    startY = height -currentWaterLevel;
    
    wavySurface = createWavySurface(cols, rows, w, l, h, startY, totalRain, time);
    shape(wavySurface);
    pop();
  }
  
}
