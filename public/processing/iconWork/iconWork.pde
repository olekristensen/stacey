void setup() 
{
  size(140, 140);
  noStroke();
  background(255,3);
  smooth();
  fill(245);
  noStroke();
  ellipse(width/2,height/2,width,height);
  fill(240,255);
  stroke(90,255);
  strokeWeight(6); 
  strokeCap(ROUND);
  strokeJoin(ROUND);
  rect(45,35,width-70,height-90);
  rect(25,55,width-70,height-90);
}

void draw() 
{
  fill(noise(20,millis()*0.0001)*255.0,255);
  strokeWeight(6); 
  stroke(90,255);
  rect(45,35,width-70,height-90);
  fill(noise(millis()*0.0001)*255.0,127);
  stroke(90,255);
  rect(25,55,width-70,height-90);
}

void mousePressed(){
  link("/works");
}
