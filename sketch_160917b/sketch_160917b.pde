Ring[] rings;
float g_diameter;
int currentRing;
int numRings = 5;
float circleSize = 2;  // circle become bigger with smaller value

void setup() {
  size(400, 400);
  frameRate(30);
  smooth();
  
  g_diameter = width;
  currentRing = 0;
  
  rings = new Ring[numRings];
  for (int i = 0; i < rings.length; i++) {
    rings[i] = new Ring();
  }
}

void draw() {
  fill(30, 100);
  rect(0, 0, width, height);  // can't use background function to transparency
  translate(width / 2, height / 2); 

  noFill();
  strokeWeight(1);
  stroke(255, 90);
  ellipse(0, 0, width, height);
  
  for (int i = 0; i < rings.length; i++) {
    if (i == 0) {
      rings[i].rotate(0, 0);
    }
    else {
      rings[i].rotate(rings[i - 1].x, rings[i - 1].y);
    }
    rings[i].display();
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (currentRing == numRings) {
      return;
    }
    rings[currentRing].start(g_diameter);
    g_diameter /= circleSize;
    currentRing++;
  }
  else {
    if (currentRing == 0) {
      return;
    }
    rings[currentRing - 1].delete();
    g_diameter *= circleSize;
    currentRing--;
  }
}
