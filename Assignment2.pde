// Assignment 2 by Group 35
// Cheuk Hang Henry CHIU 
// Jessie Mancer
// Saoban Habib
// Ziyan Lu

import beads.*;
import controlP5.*;
import processing.sound.*;
import peasy.*;

DataManager dataManager;
PeopleCounter peopleCounter;
SunManager sun;
RainManager rain;
Windows windows;

ControlP5 cp5Controller;
Slider timeSlider;
Button infoButton;
int sliderWidth;
int sliderHeight;
InfoScreen infoScreen;
Button button1;
Button button2;
Button button3;
DataInfoScreen dataScreen;
Button dataInfoButton;

color normalColor;
color pressedColor;

int day;
int timeIndex;
String timeString;

PShape buildingModel;
PImage buildingTexture;

Textlabel myTextLabel;

PeasyCam cam;

Textarea textInfo;
Textarea controlInfo;
Textarea textBackground;


float sunDataInfo;
float rainDataInfo;
float totalRainDataInfo;
float peopleDataInfo;
float luminosityDataInfo;
float peopleInData;
float peopleOutData;


void setup(){
  size(1000, 600, P3D);
  dataManager = new DataManager();
  peopleCounter = new PeopleCounter(dataManager, this);
  rain = new RainManager(this);
  sun = new SunManager();
  windows = new Windows(dataManager);
  day = 1;
  
  normalColor = color(4, 89, 194);      // Red (normal state)
  pressedColor = color(135, 189, 255);    // Green (pressed state)

  //camera
  cam = new PeasyCam(this, 900);
  cam.setMinimumDistance(200);
  cam.setMaximumDistance(1500);
  cam.lookAt(width/2,height/2, height/2);
  //cam.setDistance(200);
  cam.setSuppressRollRotationMode();
  cam.setRightDragHandler(cam.getRotateDragHandler());
  cam.setLeftDragHandler(null);
  cam.setResetOnDoubleClick(false);

  setup3D();
  setupCP5();
  controlInfo.setText(" RIGHT CLICK + DRAG --> ROTATE \n" + "                               SCROLL --> ZOOM "); 
  
}

void draw(){
  if(infoButton.isPressed())
    infoScreen.enable();
    
  if (dataInfoButton.isPressed()){
    dataScreen.enable();
    button1.setColorBackground(normalColor);
    button2.setColorBackground(normalColor);
    button3.setColorBackground(pressedColor);
  }
  if(button1.isPressed()){
    day = 1;
    button1.setColorBackground(pressedColor);
    button2.setColorBackground(normalColor);
    button3.setColorBackground(normalColor);
  }
  if(button2.isPressed()){
    day = 2;
    button1.setColorBackground(normalColor);
    button2.setColorBackground(pressedColor);
    button3.setColorBackground(normalColor);
  }
  if(button3.isPressed()){
    day = 3;
    button1.setColorBackground(normalColor);
    button2.setColorBackground(normalColor);
    button3.setColorBackground(pressedColor);
  }
  colorMode(HSB, 360, 100, 100);
  int backgroundBrightness = int(map(dataManager.solarRadiationTable.getFloat(timeIndex, day), 0,150, 18, 100));
  background(231, 29, backgroundBrightness);
  colorMode(RGB, 255, 255,255, 255);
  
  translate(0,0,height/2);
  drawBuilding();
  peopleCounter.playAmbientNoise(timeIndex, day);
  peopleDataInfo = peopleCounter.calculatePeople(timeIndex, day);
  
  timeString = dataManager.peopleInTable.getString(timeIndex, 0);
  
  rainDataInfo = rain.updateRain(day);
  totalRainDataInfo = rain.flood();
  rain.wave();
  
  sunDataInfo = sun.Sun(dataManager, day);
  
  windows.calculateMax(day);
  luminosityDataInfo = windows.drawWindows(timeIndex, day);

  translate(0, 0, height/2 + 10);
  myTextLabel.setValue(timeString);
  peopleInData = dataManager.peopleInTable.getInt(timeIndex, day);
  peopleOutData = dataManager.peopleOutTable.getInt(timeIndex, day);
  textInfo.setText( "\n In this very moment, \n"
                    +" The Solar Radiation is " + sunDataInfo + " Watts / m Square.\n"
                    + " The Rain Gauge is  " + rainDataInfo + " mm.\n"
                    + " Today total Rain Gauge till this moment is " + totalRainDataInfo + " mm.\n"
                    + " The number of People go in Building 11 \n through Broadway Entrance is " + int(peopleInData) + ".\n"
                    + " The number of People come out from Building 11 \n through Broadway Entrance is " + int(peopleOutData) + ".\n"
                    + " The recent number of people in UTS Building 11 is " + int(peopleDataInfo) + ".\n"
                    + " The luminsosity of UTS Building 11 is " + luminosityDataInfo + " v.");
  cam.beginHUD();
  cp5Controller.draw();
  dataScreen.drawScreen();
  infoScreen.drawScreen();
  cam.endHUD();
}

private void setupCP5(){
  infoScreen = new InfoScreen(this);
  dataScreen = new DataInfoScreen(this);
  
  sliderWidth = 500;
  sliderHeight = 30;
  
  
  cp5Controller = new ControlP5(this);
  timeSlider = new Slider(cp5Controller, "timeIndex");
  timeSlider.setPosition(width/2 - sliderWidth/2, height -60);
  timeSlider.setRange(0, 287);
  timeSlider.setSize(sliderWidth, sliderHeight);
  cp5Controller.setAutoDraw(false);
  
  textBackground = cp5Controller.addTextarea("background")
                  .setPosition(60,218)
                  .setSize(200,19)
                  //.setFont(createFont("arial",2))
                  //.setLineHeight(14)
                  .setColor(color(240))
                  .setColorBackground(color(255,85))
                  .setColorForeground(color(255,100));
                  ;   

  
  myTextLabel = cp5Controller.addTextlabel("textinput")
                   .setPosition(120, 220)
                   .setValue(timeString)
                   .setFont(createFont("arial",12))
                   ;
                   
                   
  infoButton = cp5Controller.addButton("Open Info")
                 .setPosition(width - 120, height - 80);
                 
  dataInfoButton = cp5Controller.addButton("Data Source")
                 .setPosition(width - 120, height - 50);
                 
  button3 = cp5Controller.addButton("MARCH_05_2023-Sunday")
   .setPosition(60,140)
   .setSize(200,19)
   .setColorBackground(normalColor)
   .setValue(0)
   ; 
  
  button2 = cp5Controller.addButton("MARCH_04_2023-Saturday")
     .setValue(0)
     .setPosition(60,120)
     .setColorBackground(normalColor)
     .setSize(200,19)
     ;
         
  
  button1 = cp5Controller.addButton("MARCH_03_2023-Friday")
     .setValue(0)
     .setPosition(60,100)
     .setColorBackground(pressedColor)
     .setSize(200,19)
     ;
     
  textInfo = cp5Controller.addTextarea("txt")
                  .setPosition(650,270)
                  .setSize(300,170)
                  .setFont(createFont("arial",11))
                  .setLineHeight(14)
                  .setColor(color(240))
                  .setColorBackground(color(255,85))
                  .setColorForeground(color(255,100));
                  ;   
                  
  controlInfo = cp5Controller.addTextarea("control")
                  .setPosition(815,38)
                  .setSize(150,50)
                  .setFont(createFont("arial",8))
                  .setLineHeight(12)
                  .setColor(color(240))
                  .setColorBackground(color(255,0))
                  .setColorForeground(color(255,0));
                  ;                    
}

private void setup3D(){
  buildingModel = loadShape("models/building.obj");  
  peopleCounter.personModel = loadShape("models/person.obj");
}

private void drawBuilding(){
  pushMatrix();
  translate(width/2, height, 0);
  rotate(PI);
  //rotateY(rotation * PI / 180);
  scale(20);
  shape(buildingModel);
  peopleCounter.drawPeople(timeIndex, day);
  popMatrix();
}
