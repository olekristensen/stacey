/* @pjs globalKeyEvents=true; 
 */

float theta;
float randomNess;
int numberBranches;
long nextScale;

void setup(){
  randomNess=1.0;
  rescale(true);
}

void draw(){
  rescale(false);
  background(245);
  //theta = map(mouseX,0,width,0,PI/2);
  randomNess = map(min(mouseX,width), 0, width, 0, 1);
  translate(width/2, height);
  numberBranches=0;
  strokeCap(SQUARE);
  branch(height*15./50.);
}

void branch(float len) {
  numberBranches++;
  
//  stroke(0,255*max(map(len, -50., 100., 0.,1.), .01));
  stroke(0);

  float theta = map(randomNess, 0, 1, 1, noise(millis()*.0001, numberBranches*PI*PI) ) * PI/2;
  strokeWeight((len*.1)+1);
  float randLen = len * (.75+map(randomNess, 0, 1, 0, noise(numberBranches%10)));
  if(randLen < 100){
    randLen +=  (20/len) * (map(randomNess, 0, 1, 0, noise(.1+numberBranches%100,numberBranches%5)));
  } else {
      randLen -=  (12000/len) * (map(randomNess, 0, 1, 0, noise(.25+numberBranches%75,numberBranches%3)));
  }
  line(0, 0, 0, -randLen);
  translate(0, -randLen);
 
  len *= 0.65;
 
  if (len > 6) {
    
    // Call branch() a random
    // number of times.
    int n = round(map(randomNess, 0, 1, 2, noise(numberBranches*.1234)*6));
    for (int i = 0; i < n; i++) {
    pushMatrix();
    rotate(theta);
    branch(len);
    popMatrix();
      theta =-theta*map(randomNess, 0, 1, 1, noise(n*.045));
    }
  }
}

void mouseClicked() {
  noiseSeed();
}

void rescale(boolean force){

  int oldWidth = width;
  int oldHeight = height;

  int containerWidth = $('div.well center').innerWidth();

  int theHeight = 500;
  if(containerWidth < 767){
    theHeight = 350;
  }
  if(containerWidth < 400){
    theHeight = 200;
  }


  //containerWidth = min(theHeight*1.2, containerWidth);
  
  size(containerWidth,theHeight);

  if(oldWidth != width || oldHeight != height){
    scaling = true;
  }

  if(scaling || force ) {
      if(nextScale < millis()){
            scaling = false;

        } else {
            scaling = true;
        }

    } else {
        nextScale = millis() + 1000;
    }
}

