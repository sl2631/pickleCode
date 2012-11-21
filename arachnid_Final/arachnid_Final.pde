PImage img;

Node[] node;
int corners = 12;
int nodes = 50;
int randomNmb;
boolean bFound;
boolean timeOut = false;

void setup() {
  size(600, 600);
  smooth();

  img = loadImage("tinySpider.jpg");

  node = new Node[nodes];
  for (int i=0;i<node.length;i++) {
    node[i]= new Node(i);
  }
  PFont font;
  font = loadFont("Impact-18.vlw"); 
  textFont(font);

  bFound = false;
  randomNmb = (int)random(1, 49); 
  frameRate(30);
}

void draw() {
  background(0, 205, 255);
  text(randomNmb, 20, 20);
  String timer = "" + (30 - millis()/1000);
  fill(236,58,152);
  text(timer, width - 50, 50);

  imageMode(CENTER);
  image(img, mouseX, mouseY);
  if (!timeOut) {
    if (bFound)
    { 
      randomNmb = (int)random(1, 49); 
      bFound = false;
    }

    for (int i=0;i<node.length;i++) {
      boolean bTmp;

      bTmp = node[i].update(randomNmb);
      if (bTmp)
        bFound = true;
      node[i].display();
    }
  }
  if (30 - millis()/1000 <= 0) {
    timeOut = true;
  }
}




