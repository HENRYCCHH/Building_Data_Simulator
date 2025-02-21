import controlP5.*;

public class InfoScreen{
  ControlP5 screenController;
  Textlabel title;
  Textlabel infoText;
  Button closeButton;
  Button infoButton;
  String titleString;
  String infoTextString;
  PFont titleFont;
  PFont textFont;
  
  boolean enabled;
  
  public InfoScreen(Assignment2 ass2){
    screenController = new ControlP5(ass2);
    setupScreen();
    enabled = true;
  }
  
  private void setupScreen(){
    titleFont = createFont("calibri.ttf", 32);
    textFont = createFont("calibri.ttf", 15);
    
    titleString = "Building Simulator";
    title = screenController.addTextlabel("Building Simulator")
              .setPosition(width/2 - 110, height/5)
              .setValue(titleString)
              .setColor(0)
              .setFont(titleFont)
              ;
              
    infoTextString = "This is our building simulator that simulates data taken from UTS Building 11. \nData for the program was taken from the FEIT website with data from 3 days. \nThis data was processed so that the data had equal time periods of 5 minutes, \n with empty values based on previous data. \n\nRain is shown by raindrops from the cloud and the amount of rain is illustrated by the speed of piano playing. \nTotal rain is shown as flooding water that rises and piano only plays when there is certain rain accumulated. \nTotal number of people in UTS is shown by the little people climbing up,\n which is only based on the calculation of people goes in or out through Broadway Entrance, \n with each person figure representing 5 people in the building.\nThe number of people go in at each time is shown by number of person figure entering the green door \n and people out is shown by number of person figure exiting the red door. \nSolar radiation is shown by the sun in the top corner, with the opacity of the sun rays modified by the level of \n solar radiation and the modification of the color of the background. \nLuminosity of the building is shown by the opacity of the window. \n\nThe slider at the bottom of the screen allows you to change the time of the data. \nThe text info on the side shows information on the different data types. \nThe buttons at the top left corner allow for the day of data to be chosen. \nThe DATA SOURCE button shows the original data information.";
    infoText = screenController.addTextlabel("body text")
              .setPosition(width/8 + 10, height/4 + 10)
              .setValue(infoTextString)
              .setColor(0)
              .setFont(textFont)
              ;
    closeButton = screenController.addButton("Close Info")
                  .setPosition(width/2 - 30, height * 7/8 - 60)
                  ;
       
    screenController.setAutoDraw(false);
  }
  
  public void drawScreen(){
    if(enabled){
      fill(200);
      rect(width/8, height/8, width * 6/8, height * 6/8);
      screenController.draw();
      if(closeButton.isPressed()){
        enabled = false;
      }
    }
  }
  
  public void enable(){
    enabled = true;
  }
}
