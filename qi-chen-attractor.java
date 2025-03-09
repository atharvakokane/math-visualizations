float x = 10;
float y = 10;
float z = 10;
float P = 38;
float R = 8.0/3.0;
float B = 80;
float dt = 0.001;
float sc = 2;

ArrayList<PVector> points;

void setup(){
  size(800, 1000, P3D);
  points = new ArrayList<PVector>();
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(0);
  
  float nx = x + dt * (P * (-x + y) + y * z);
  float ny = y + dt * (B * x - x * z + y);
  float nz = z + dt * (-R * z + x * y);
  PVector temp = new PVector(nx, ny, nz);
  
  temp.mult(sc);
  points.add(temp);
  
  pushMatrix();
    translate(0.5 * width, 0.7 * height);
    
    rotateX(0.5 * PI);
    rotateZ(frameCount * 0.01);
    
    for(int i = 0; i <points.size() - 1; i++){
      PVector p1 = points.get(i);
      PVector p2 = points.get(i + 1);
      stroke(255);
      line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
    }
  
    pushMatrix();
    PVector end = points.get(points.size() - 1);
    translate(end.x, end.y, end.z);
    fill(255);
    sphere(5);
    popMatrix();
  
  popMatrix();
  x = nx;
  y = ny;
  z = nz;
}
