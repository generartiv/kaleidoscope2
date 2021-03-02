
float x;
float y;
float xPrec;
float yPrec;
PImage imgPrec;

float numPass=0;

void setup() {
  size(1280, 720);
  frameRate(60);
  background(0);
  imgPrec = new PImage(width, height);
  imageMode(CENTER);

  x =xPrec = noise(numPass * 0.00727) * width;
  y = yPrec = noise((11+numPass) * 0.00572) * height;
}

void draw() {

  xPrec = x;
  yPrec = y;
  numPass++;

  imgPrec = get();
  tint(255, 164);  // Display at half opacity
  pushMatrix();
  translate(width/2, height/2);
  float nbCopies = 8;

  rotate(-0.00342);
  for (int i = 0; i<nbCopies; i++) {

    image(imgPrec, -1.4, -1.4, width + 3, height+3);
    rotate(TWO_PI/nbCopies);
  }
  translate(-width/2, -height/2);
  popMatrix();
  x = noise(numPass * 0.00727) * width;
  y = noise((11+numPass) * 0.00572) * height;
  stroke(241);
  strokeWeight(6);
  line(xPrec, yPrec, x, y);

  
}