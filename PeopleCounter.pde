import beads.*;

public class PeopleCounter {
  DataManager dataManager;
  public PShape personModel;
  PImage[] colours;
  float gainValue =0;
  
  
  
  SoundFile peopleSound;
  
  
  
  public PeopleCounter(DataManager data, Assignment2 ass2){
    dataManager = data;
    colours = new PImage [10];
    for(int i = 0; i < colours.length; i++){
      colours[i] = loadImage("models/PeopleColours/" + (i + 1) + ".png");
    }
    peopleSound = new SoundFile(ass2, "CrowdSound.wav");
    peopleSound.loop(1, gainValue);
    

    
  }
  
  public void drawPeople(int timeIndex, int day){
    int columns = 0;
    int rowsIn = 0;
    int rowsOut = 0;
    pushMatrix();

    translate(11, 0, 5);
    for(int i = 0; i < calculatePeople(timeIndex, day) / 5; i++){
      if(i % 20 == 0 && i > 1){
        columns++;
      }
      pushMatrix();
      scale(0.5);
      translate(0, 2 * i - (columns * 40), columns * 2);
      personModel.setTexture(colours[i % 10]);
      shape(personModel);
      popMatrix();
      
    }
    popMatrix();
    pushMatrix();
    translate(11, 0, -4);
    for(int i = 0; i < dataManager.peopleInTable.getInt(timeIndex, day); i++){
      pushMatrix();
      scale(0.5);
      translate(i * 2 - (rowsIn * 20), 0, -2 * rowsIn);
      personModel.setTexture(colours[i % 10]);
      shape(personModel);
      popMatrix();
      if(i % 10 == 0 && i > 1){
        rowsIn++;
      }
    }
    popMatrix();
    pushMatrix();
    translate(10, 0, 2);
    for(int i = 0; i <= dataManager.peopleOutTable.getInt(timeIndex, day); i++){
      pushMatrix();
      scale(0.5);
      translate(i * 2 - (rowsOut * 20), 0, 2 * rowsOut);
      personModel.setTexture(colours[i % 10]);
      shape(personModel);
      popMatrix();
      if(i % 10 == 0 && i > 1){
        rowsOut++;
      }
    }
    popMatrix();
  }

  public int calculatePeople(int timeIndex, int day){
    int people = 0;
    for(int i = 0; i < timeIndex; i++){
      people += dataManager.peopleInTable.getInt(i, day);
      people -= dataManager.peopleOutTable.getInt(i, day);
    }
    return people;
  }
  
  public void playAmbientNoise(int timeIndex, int day){
    int maxPeople = 0;
    for(int i = 0; i < dataManager.peopleInTable.getRowCount(); i++){
      maxPeople += dataManager.peopleInTable.getInt(i, day);
    }
    gainValue = (float)calculatePeople(timeIndex, day) / ((float)maxPeople *2);
    peopleSound.amp(gainValue);
  }
}
