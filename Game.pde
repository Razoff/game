float depth = 2000;
float angle = 0;
float velocity = 10;

void setup() {
  size(500, 500, P3D);
  noStroke();
}

void draw() {
  camera(width/2, height/2, depth, 250, 250, 0, 0, 1, 0);
  directionalLight(50, 100, 125, 0, -1, 0);
  ambientLight(102, 102, 102);
  background(200);
  translate(width/2, height/2, 0);
  float tiltZ = map(mouseX, width/2, width * velocity/10, 0, PI/3);
  float tiltX = map(mouseY, height/2, height * velocity/10, 0,-PI/3 );
  
  if(tiltZ >= PI/3){
    tiltZ = PI/3;
  }
  if(tiltZ <= -PI/3){
   tiltZ = -PI/3; 
  }
   if(tiltX >= PI/3){
    tiltX = PI/3;
  }
  if(tiltX <= -PI/3){
   tiltX = -PI/3; 
  }
  
  println("TiltZ : "+ tiltZ);
  println("TiltX : "+ tiltX);
  
  rotateZ(tiltZ);
  rotateX(tiltX);
  rotateY(angle);
  box(2500,100,2500);

  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      angle = angle + PI/16;
    }
    else if (keyCode == RIGHT) {
      angle = angle - PI/16;
    }
  }
}

void mouseWheel(MouseEvent event) {
  velocity = velocity + event.getCount();
}
