int cols, rows;
float[][] field;
float scl = 5;
float inc = 0.05;
float offsetX = 0;
float offsetY = 0;

void setup() {
  size(1000, 1000);
  cols = floor(width / scl);
  rows = floor(height / scl);
  field = new float[cols][rows];
  noStroke();
  background(0);
}

void draw() {
  background(0, 50);

  float xOff = offsetX;
  for (int i = 0; i < cols; i++) {
    float yOff = offsetY;
    for (int j = 0; j < rows; j++) {
      field[i][j] = noise(xOff, yOff) * TWO_PI;
      yOff += inc;
    }
    xOff += inc;
  }

  for (int i = 0; i < cols - 1; i++) {
    for (int j = 0; j < rows - 1; j++) {
      float angle = field[i][j];
      float x = i * scl;
      float y = j * scl;
      float vX = cos(angle) * scl;
      float vY = sin(angle) * scl;
      stroke(255, 100);
      line(x, y, x + vX, y + vY);
    }
  }

  offsetX += 0.01;
  offsetY += 0.01;

  inc = map(mouseX, 0, width, 0.02, 0.1);
  scl = map(mouseY, 0, height, 5, 15);
}
