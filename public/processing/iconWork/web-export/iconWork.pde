PVector mouse, center, ballVel, ballPos;
float diameter;
long nextTimeMillis;
float mouseInside;
float drawWidth, drawHeight, drawMargin;
boolean parentFocused;

void setup(){
  size(140,140);
  smooth();
  background(255,0);
  center = new PVector(0,0);
  mouse = new PVector(0,0);
  ballVel = new PVector(0, 0);
  ballPos = new PVector(0, height/10*4);
  diameter = width * 0.25;
  colorMode(HSB, 360,100,100);
  mouseInside = 0;
  drawMargin = 10;
  drawWidth = width-(2*drawMargin);
  drawHeight = height-(2*drawMargin);
  parentFocused = false;
}

void draw(){
  background(0,0,100,0);
  pushMatrix();
  translate(width/2, height/2);
  mouse.set(mouseX-(width/2), mouseY-(height/2), 0);
  if (mouse.dist(center) < drawWidth/2 || parentFocused) {
    if(mouseInside <= 1.0) mouseInside+=0.05;
    mouseInside=min(1.0, mouseInside);
  } else {
    if(mouseInside > 0) mouseInside-=0.025;
    mouseInside=max(0.0, mouseInside);
  }
  fill(207,0,90*(1.0-(mouseInside*0.5)));
  noStroke();
  ellipse(0, 0, drawWidth-1, drawHeight-1);
  fill(207,0,map(mouseInside, .0, 1., 90, 100));
  if(ballPos.dist(mouse) < diameter){
    PVector v = PVector.sub(ballPos, mouse);
    v.mult(0.0333);
    ballVel.add(v);
  }
  if(ballPos.dist(center) > drawWidth*0.3){
    PVector v = PVector.mult(ballPos,-.01);
    ballVel.add(v);
  } else {
    if(millis() > nextTimeMillis){
        ballVel.add(5*(0.5-noise(millis()*0.0005,0,0)),
        5*(0.5-noise(0, millis()*0.0005,0)), .0);
        nextTimeMillis = millis() + 2000 + round(random(2000));
    }
    ballVel.add(.0,0.01,.0);
  }
  ballVel.mult(0.99);
  ballPos.add(ballVel);
  float ballSize = map(mouseInside, .0, 1., drawWidth, diameter);
  ellipse(ballPos.x*mouseInside, ballPos.y*mouseInside, ballSize,ballSize);
  popMatrix();
}

void setParentFocused(){
  parentFocused = true;
}

void setParentBlurred(){
  parentFocused = false;
}

