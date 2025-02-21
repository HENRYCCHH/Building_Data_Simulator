public class DataManager {
  //Here are each of the tables for the data
  //The first column is the time of day, and the second third and fourth columns are the 1st, 2nd and 3rd day results at that time
  public Table peopleInTable;
  public Table peopleOutTable;
  public Table rainTable;
  public Table totalRainTable;
  public Table solarRadiationTable;
  public Table lightVoltageTable;
  
  //The loading of data is handled by the constructor.
  //I performed some processng of the data so that it would work together well:
  //the time periods are all of equal length now so that each table uses the same time values
  //data from the three days was also collated into one file so that less files were needed
 
  public DataManager(){
    peopleInTable = loadTable("PeopleCountInDataAdjusted.csv");
    peopleOutTable = loadTable("PeopleCountOutDataAdjusted.csv");
    rainTable = loadTable("RainDataAdjusted.csv");
    totalRainTable = loadTable("RainTotalDataAdjusted.csv");
    solarRadiationTable = loadTable("SolarRadiationDataAdjusted.csv");
    lightVoltageTable = loadTable("LightVoltageDataAdjusted_v2.csv");
  }

}
