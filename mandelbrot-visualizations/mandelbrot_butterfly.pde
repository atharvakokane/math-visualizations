float t = 0;

void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  noFill();
}

void draw() {
  translate(width / 2, height / 2);

  beginShape();
  for (float i = 0; i < t; i += 0.02) {
    float x = sin(i) * (exp(cos(i)) - 2 * cos(4 * i) - pow(sin(i / 12), 5));
    float y = cos(i) * (exp(cos(i)) - 2 * cos(4 * i) - pow(sin(i / 12), 5));
    vertex(x * 50, y * 50);
  }
  endShape();
  t += 0.02;
}
