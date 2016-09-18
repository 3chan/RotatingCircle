class Ring {
  float x, y;
  float prediameter;
  float diameter;
  float rad;  // may cause overflow
  boolean on = false;
  
  void start(float predia) {
    prediameter = predia;
    diameter = predia / circleSize;
    rad = 0;
    on = true;
  }
  
  void rotate(float prex, float prey) {
    if (on == true) {
      rad += PI / 100;
      x = prex + ((prediameter / 2 * (circleSize - 1) / circleSize) * sin(rad));
      y = prey + ((prediameter / 2 * (circleSize - 1) / circleSize) * cos(rad));
    }
  }
  
  void display() {
    if (on == true) {
      noFill();
      strokeWeight(1);
      stroke(255, 153);
      ellipse(x, y, diameter, diameter);
    }
    else {
      diameter = 0;
    }
  }
  
  void delete() {
    on = false;
  }
}
