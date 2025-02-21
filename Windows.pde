public class Windows{
  DataManager dataManager;
  float maxVoltage;
  
  public Windows(DataManager data){
    dataManager = data;
    maxVoltage = 0;
  }
  
  public float calculateMax(int day){
    for(int i = 0; i < dataManager.lightVoltageTable.getRowCount(); i++){
        if(dataManager.lightVoltageTable.getFloat(i, day) > maxVoltage){
          maxVoltage = dataManager.lightVoltageTable.getFloat(i, day);
        }
    }
    return maxVoltage;
  }
  
  public float drawWindows(int timeIndex, int day){
    noStroke();
    float lightLevel = (float)dataManager.lightVoltageTable.getFloat(timeIndex, day)/ maxVoltage;
    println(int(lightLevel*255));
    fill(random(225), random(225), random(225), int(lightLevel *255));
    //window 1
    pushMatrix();
    //fill(0, 31, 100);
    translate(369, 377, 36);
    box(75);
    popMatrix();
    
    //window 2
    pushMatrix();
    //fill(0, 31, 100);
    translate(469, 381, 40);
    box(96, 70, 75);
    popMatrix();
    
    //window 3
    pushMatrix();
    //fill(0, 31, 100);
    translate(588, 381, 40);
    box(92, 70, 75);
    popMatrix();
    
    // window 4
    pushMatrix();
    //fill(0, 31, 100);
    translate(360, 466, 41);
    box(72);
    popMatrix();
    
    // window 5
    pushMatrix();
    //fill(0, 31, 100);
    translate(467, 469, 43);
    box(100, 70, 75);
    popMatrix();
    
    // window 6
    pushMatrix();
    //fill(0, 31, 100);
    translate(588, 469, 46);
    box(105, 70, 75);
    popMatrix();
    
    return lightLevel *maxVoltage;
  }
}
