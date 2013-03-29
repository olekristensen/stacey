PVector mouse, center, ballVel, ballPos;
PVector curlVec;
boolean eraseBackground;
float mouseInside;
float drawWidth, drawHeight, drawMargin;
boolean parentFocused;

void setup() 
{
  size(140, 140);
  smooth();
  background(255, 0);
  center = new PVector(0, 0);
  mouse = new PVector(0, 0);
  colorMode(HSB, 360, 100, 100);
  mouseInside = 0;
  drawMargin = 10;
  drawWidth = width-(2*drawMargin);
  drawHeight = height-(2*drawMargin);
  curlVec = new PVector(0, 0);
  eraseBackground = true;
  parentFocused = false;
}

void draw() 
{
  mouse.set(mouseX-(width/2), mouseY-(height/2), 0);
  if (parentFocused) {
    if (mouseInside <= 1.0) mouseInside+=0.05;
    mouseInside=min(1.0, mouseInside);
  } 
  else {
    if (mouseInside > 0) mouseInside-=0.025;
    mouseInside=max(0.0, mouseInside);
  }
  eraseBackground = (mouseInside < 1.0);
  if (eraseBackground) {
    background(0, 0, 100, 0);
  }
  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  if (eraseBackground) {
    fill(207, 0, 90*(1.0-(mouseInside*0.5)));
    ellipse(0, 0, drawWidth-1, drawHeight-1);
    fill(207, 0, map(mouseInside, .0, 1., 90, 100));
    float ballSize = map(mouseInside, .0, 1., drawWidth, width/2);
    ellipse(0*mouseInside, 0*mouseInside, ballSize, ballSize);
    fill(207, 0, 100, map(mouseInside, .0, 1., 0, 500));
    ellipse(0,(height*0.6)-(height*mouseInside*0.25), width, height*0.25);
  }
  if (mouseInside >= 1.0) {
    PVector nextVec = new PVector(cos(millis()*0.005)*(width*0.27), 
                                  -abs(sin(((millis()*0.005))))*(width*0.27));
    nextVec.add((0.5-noise(millis()*0.01, 0, 0))*50,
                (0.5-noise(0, millis()*0.01, 0))*50,
                0);
    if(curlVec.mag() > 0){
      stroke(207, 0 ,0,127);
      noFill();
      line(curlVec.x, curlVec.y, nextVec.x, nextVec.y);
    }
    curlVec = nextVec;      
  } 
  else {
    curlVec.set(0,0,0);
  }
  popMatrix();
}


void setParentFocused(){
  parentFocused = true;
}

void setParentBlurred(){
  parentFocused = false;
  
}

