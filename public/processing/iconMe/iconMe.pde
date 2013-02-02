void setup() 
{
  size(140, 140);
  noStroke();
  background(255,3);
  smooth();
}

void draw() 
{
  fill(245);
  noStroke();
  ellipse(width/2,height/2,width,height);

  fill(240,255);
  stroke(90,255);
  strokeWeight(6); 
  strokeCap(ROUND);
  strokeJoin(ROUND);

}

void mousePressed(){
  link("/lab");
}
