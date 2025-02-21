public class SunManager {
  public float Sun(DataManager dataManager, int dayNumber){
    //Sun
    float strokeIntensity = map(dataManager.solarRadiationTable.getFloat(timeIndex, dayNumber), 0, 300, 0, 255);
    fill(255, 255, 0, strokeIntensity *3); // Set the fill color to yellow
    ellipse(width - 80, 80, 80, 80); // Draw a yellow circle (the sun)
    stroke(255, 255, 0, strokeIntensity); // Set the stroke color to yellow with variable intensity
    for (int i = 0; i < 16; i++) {
      float angle = TWO_PI / 16 * i;
      float x1 = width - 80;
      float y1 = 80;
      float x2 = x1 + cos(angle) * 70;
      float y2 = y1 + sin(angle) * 70;
      strokeWeight(5);
      line(x1, y1, x2, y2);
    }
    float sundata =dataManager.solarRadiationTable.getFloat(timeIndex, dayNumber);
    return sundata;
  }

}
