# Building Data Simulator

## Overview
This is a **building simulator** that visualizes environmental and occupancy data from **Building 11 of University of Technology Sydney**. The simulation is based on real-world data collected from the **Faculty of Engineering and IT (FEIT) website** over **three days**. The data has been processed to ensure **5-minute intervals**, with missing values filled based on previous readings.
A video demonstration highlights the application's functionality and key features :
[Interactive Building Simulator: A Creative Data-Driven Visual Experience](https://youtu.be/2RwUtH6Drbs)

## Features & Visualization
This simulator represents various environmental and occupancy factors using interactive and animated elements:

### **Rain Representation**
- Raindrops from the cloud illustrate the presence of rain.
- The amount of rain is **linked to the speed of a piano playing**.
- **Total accumulated rain** is represented as **rising flood water**.
- The piano plays **only when a certain level of rain has accumulated**.

### **Building Occupancy**
- The total number of people in **UTS Building 11** is depicted by small figures climbing up.
- This is based on the **calculation of people entering and exiting through the Broadway Entrance**.
- **Each figure represents 5 people in the building**.
- The number of people entering at a specific time is shown by **figures entering through a green door**.
- The number of people exiting is represented by **figures leaving through a red door**.

### **Solar Radiation**
- The **sun** in the top corner represents solar radiation levels.
- The **opacity of the sun’s rays** is modified based on the level of solar radiation.
- The **background color also changes** according to radiation intensity.

### **Building Luminosity**
- The **opacity of the windows** dynamically changes to reflect the building’s luminosity level.

## Interactive Controls
- **Time Slider (Bottom of the screen)**: Adjusts the simulation time to view data at different intervals.
- **Text Info Panel (Side Panel)**: Displays information on the various data types.
- **Day Selection Buttons (Top Left Corner)**: Allows users to switch between different days of recorded data.
- **DATA SOURCE Button**: Opens the original dataset for reference.

## Data Processing
- The data was processed to ensure **uniform 5-minute time intervals**.
- Missing values were filled **based on previous recorded data**.

## Team Collaboration
This project was developed as a **team collaboration** with contributions from:
- **Jessie Mancer**
- **Ziyan Lu**
- **Saoban Salwa Habib**
- **Cheuk Hang Henry Chiu**

## Library list:
 
Beads Library:
http://www.beadsproject.net/
 
ContolP5:
https://www.sojamo.de/libraries/controlP5/
 
peasycam:
https://mrfeinberg.com/peasycam/
 

## Acknowledgments
We extend our gratitude to the **Faculty of Engineering and IT (FEIT) at UTS** for providing access to the building’s environmental and occupancy data.


