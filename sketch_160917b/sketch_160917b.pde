Ring[] rings;
float g_diameter;
int currentRing;
int numRings = 5;
float circleSize = 2;

//float rad = 0;

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
//  background(50, 100);
  fill(30, 100);
  rect(0, 0, width, height);
  translate(width / 2, height / 2); 

  noFill();
  strokeWeight(1);
  stroke(255, 153);
//  ellipse(0, 0, width, height);
  
//  println("currentRing = " + currentRing);
  
//  rad += 90;
  
  for (int i = 0; i < rings.length; i++) {
    println((i + 1) + "rd.x = " + rings[i].x);
    if (i == 0) {
      rings[i].rotate(0, 0);
    }
    else {
      rings[i].rotate(rings[i - 1].x, rings[i - 1].y);
//      rings[i].display(rings[i - 1].x, rings[i - 1].y);
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
