PVector vx, vy, vz;

boolean RENDERMODE = false;

void setup() {
  background(0);
  size(320, 320, P3D);
  
  textureMode(NORMAL);
  
  frameRate(60);

  vx = new PVector(1, 0, 0);
  vy = new PVector(0, 1, 0);
  vz = vx.cross(vy);
}

void draw() {
 background(0);
 translate(width/2, height/2);  // center
 
 // Camera view, top-down
 rotateX(-PI/2);
 
 //int arms = int(16.0 * (1.0 + sin(millis() / 10000.0)/2.0));
 octoArms(16);
 
 if(false) {
   pushMatrix();
   // Rotate towards camera
   rotateZ(-PI/8);
   translate(400, 0, 0);
   octoArms(8);
   popMatrix();
 }
 
 if(RENDERMODE) {
   saveFrame("frames/####.png");
 }
 
 println(frameCount, frameRate, _millis());
}

void octoArms(int arms) {
  for(int r=0; r<arms; r++) {
   pushMatrix();
   rotateY(2*PI/arms * r);
   for(int k=0; k<10; k++) {
     translate(0, 10, 0);
     createArray(16, 8);
   }
   popMatrix();
 }
}

float _millis() {
  if(RENDERMODE) {
    // Simulation time  
    return frameCount * 1000.0/frameRate; 
  } else {
    // View time
    return millis();
  }
}

void boxColor(float r) {
 float speed = 200.0;
 float wavelength = 20;
 
 float intensity = (sin(_millis()/speed + r/wavelength) + 1.0) / 2.0;
 
 // fill = color(255*intensity, 100*intensity, 0);
 // stroke = colo(100, 30, 0);
 
 colorMode(HSB, 255);
 color c = color((200 * intensity) % 255, 255, 255);
 
 fill(c);
 stroke(0, 0, 0);
}

void createArray(int n) {
  createArray(n, 20.0);
}

void createArray(int n, float dist) {
  for(int i=0; i<n; i++) {
     rotateY(_millis()/80000.0);
     pushMatrix();
     rotateY(_millis()/80000.0);
     
     // TODO: Sync with MIDI/music
     float size = pow(2+sin(_millis()/200.0)/2, 2);
     translate(i*dist*size/4, 0, 0);

     boxColor(i * dist);
     box(4.0);
     popMatrix();
   }
}

void funkyStar() { 
 for(int r=0; r<8; r++) {
   pushMatrix();
   rotateY(PI/4 * r);
   for(int k=0; k<10; k++) {
     translate(10, 0, 0);
     createArray(8);
   }
   popMatrix();
 }
}

void weirdShit() {
 for(int i=0; i<3; i++) {
   color(i*50, 50, 50);
   pushMatrix();
   rotateZ(2*PI/3*i);
   for(int j=0; j<5; j++) {
     for(int k=0; k<5; k++) {
       pushMatrix();
       float width = 20/(k+1);
       translate(20*j + 60, 10*k - 50);
       box(width);
       popMatrix();
     }
   }
   popMatrix();
 }
}