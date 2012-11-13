// SuperPAC Money Donors


ArrayList<TopTen> descriptions = new ArrayList();

String[] donors;
float[] amounts;
float[] colours;

float x;
float y;
float rX;

PFont descriptionFont;

void setup() {
  size(850, 800);
  smooth(8);
  
  descriptionFont = loadFont("GillSans-Light-18.vlw");
  loadData();
  loadTopTenData();
}

void draw() {
  
  background(79,169,88, 150);
  
    textFont( descriptionFont, 22);
  textAlign (LEFT);
  fill (255);
  text("TOP TEN SUPER PAC DONORS FOR THE 2012 ELECTION", 10, 20);
 drawXAxisLines();
  // fill (255,255,0); 
 //  rect (400, 220, 200,200);

   textFont( descriptionFont, 12);
  drawDataBars();  
  drawBarLabels();
  drawXAxisLabel();
  
  
  println ("x:" + mouseX + "y:" + mouseY);
  
  
}


void loadData() {

  String[] rows = loadStrings("donors.csv");
  donors        = new String[rows.length];
  amounts       = new float[rows.length];

  // Skip first row—column headers
  for (int i = 1; i < rows.length; i++) {
    String[] columns  = rows[i].split(",");
    String donor      = columns[0];
    float amount      = float(columns[1]);

    donors[i]   = donor;
    amounts[i]  = amount;
  }
}


void drawDataBars() {

  float rY;
  float rWidth;
  float rHeight;

  int textY = 270;
  int newLine = 40;
  int textX = 400;
  textAlign(LEFT);
  
  for (int j= 0; j<descriptions.size(); j++) {
    TopTen top = descriptions.get(j);

    float chosenIndex = floor(map(mouseY, 60, amounts.length * 60, 1, amounts.length)); 
   
    if (chosenIndex == 1) {  //  DONOR 1  Sheldon Adelson
      text ( top.adelson, textX, textY+ newLine*j);
      println("Sheldon Adelson");
    } 
    else if (chosenIndex == 2) { // DONOR 2   Harold Simmons
      text ( top.simmons, textX, textY+ newLine*j);
      println("Harold Simmons");
    } 
    else if (chosenIndex == 3) {  // DONOR 3  Bob Perry
      text ( top.perry, textX, textY+ newLine*j);
      println("Bob Perry");
    } 
    else if (chosenIndex == 4) { // DONOR 4   Joe Ricketts
      text ( top.ricketts, textX, textY+ newLine*j);
      println("Joe Ricketts");
    } 
    else if (chosenIndex == 5) {   // DONOR 5   Fred Eychaner
      text ( top.eychaner, textX, textY+ newLine*j);
      println("Fred Eychaner");
    } 
    else if (chosenIndex == 6) { // DONOR 6  National Education Association
      text ( top.NEA, textX, textY+ newLine*j); 
      println("National Education Association");
    } 
    else if (chosenIndex == 7) { // DONOR 7   United Auto Workers
      text ( top.UAW, textX, textY+ newLine*j);
      println("United Auto Workers");
    } 
    else if (chosenIndex == 8) { // DONOR 8  Republican Governors Association
      text ( top.RGA, textX, textY+ newLine*j);
      println("Republican Governors Association");
    } 
    else if (chosenIndex == 9) { // DONOR 9  James H. Simons
      text ( top.simons, textX, textY+ newLine*j);
      println("James H. Simons");
    } 
    else if (chosenIndex == 10) { // DONOR 10   AFL-CIO
      text ( top.AFL, textX, textY+ newLine*j);
      println("AFL-CIO");
      println ( "AFL y" + textY+ newLine*j);
    }
  }


  for (int i = 1; i < amounts.length; i++) {
    float a = amounts[i];
noStroke();
    rX = 180;
    rY = i * 60;
    rWidth = map(a, 0, max(amounts), 0, width-350);
    rHeight = 50;

// red for democrats
    if ( i <5 || i==6) { // blue for democrats
      fill(0,81,180);
    }
    else { 
      fill (255,0,64,200); //  red for democrats
    }
    rect(rX, rY, rWidth, rHeight);
  }
}



void drawBarLabels() {

  int yOffset = 30;

  for (int i = 1; i < amounts.length; i++) {

    y = i * 60;

    textAlign(RIGHT);
    noStroke();
    fill(255);
    text(donors[i], 160, y + yOffset);
  }
}


void drawXAxisLines() {

  float xOffset = rX;

  for (int i = 0; i < amounts.length; i++) {

    float xLine = map(i * 5, 0, max(amounts), 0, width);

  stroke (50);
    strokeWeight(0.5);

    if (xLine < 400) {
      line(xLine + xOffset, 40, xLine + xOffset, width - 55);
    }
  }
}


void drawXAxisLabel() { 

  int xOffset = 200;

  for (int i = 1; i < amounts.length; i++) {

    float xLine = map(i * 5, 0, max(amounts), 0, height);

    if (xLine < 400) {
      text(i * 10, xLine + xOffset, 45);
      //text(xLine + xOffset, i * 10, 65);
    }
  }
}

void loadTopTenData() {

  String[] rows = loadStrings("topTenFinal.csv");

  for (int i = 0; i < 7; i++) {

    TopTen top = new TopTen();
    top.fromCSV(rows[i].split(","));
    descriptions.add(top);
  }
}

void keyPressed()
{
  //SAVE IMAGES OUT
  if (key == 's')
  {  

    save("image_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".tiff");
    println("Saved Image");
  }
}

