import controlP5.*;

public class DataInfoScreen{
  ControlP5 screenController;
  Textlabel title;
  Textlabel infoText;
  Button closeDataButton;
  Button infoButton;
  String titleString;
  String infoTextString;
  PFont titleFont;
  PFont textFont;
  
  boolean enabled;
  
  public DataInfoScreen(Assignment2 ass2){
    screenController = new ControlP5(ass2);
    setupDataScreen();
    enabled = true;
  }
  
  private void setupDataScreen(){
    titleFont = createFont("calibri.ttf", 32);
    textFont = createFont("calibri.ttf", 18);
    
    titleString = "Data Sources";
    title = screenController.addTextlabel("Data Sources")
              .setPosition(width/2 - 110, height/5)
              .setValue(titleString)
              .setColor(0)
              .setFont(titleFont)
              ;
              
    infoTextString = "\nThe data sources used from the FEIT website were:\n•People counter: People Counters Broadway East In and People Counters Broadway East Out  \n•Rainfall: Weather Station Rain Gauge Data  \n•Total Rainfall: Weather Station Rain Total from 9am Data (with adjustment) \n•Power & Lighting: Waspmote Data for Building 11 using Luminosity Sensor (with adjustment) \n•Sun (Radiation): Weather Station Solar Radiation Data";
    infoText = screenController.addTextlabel("body text")
              .setPosition(width/8 + 10, height/4 + 10)
              .setValue(infoTextString)
              .setColor(0)
              .setFont(textFont)
              ;
    closeDataButton = screenController.addButton("Close")
                  .setPosition(width/2 - 30, height * 7/8 - 60)
                  //.setFont(textFont);
                  ;
       
    screenController.setAutoDraw(false);
  }
  
  public void drawScreen(){
    if(enabled){
      fill(200);
      rect(width/8, height/8, width * 6/8, height * 6/8);
      screenController.draw();
      if(closeDataButton.isPressed()){
        enabled = false;
      }
    }
  }
  
  public void enable(){
    enabled = true;
  }
}
