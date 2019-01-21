ArrayList<Bouncer> bouncers;

int frameIndex = 0;

void setup() {
  size(512, 512);
  pixelDensity(displayDensity());
  frameRate(60);

  bouncers = new ArrayList<Bouncer>();

  colorMode(HSB);

  for (int i = 0; i < 12; i++) {
    color col = color(i * 3, random(0, 220), 220);
    bouncers.add(new Bouncer(new PVector(width/2, height/2), 20, col));
    bouncers.get(i).addForce(new PVector(random(-5.5, 5.5), random(-5.5, 5.5)));
  }


  
  background(106, 9, 247, 10);
  //background(0);

  blendMode(MULTIPLY);
}


void draw() {
  
  

  //fill(255, 10);
  //rect(0, 0, width, height);
  

  for (Bouncer bouncer : bouncers) {
    //bouncer.addForce(new PVector(random(-2.3, 2.3), random(-2.3, 2.3)));
    bouncer.addForce(new PVector(random(-0.1, 0.1), random(-0.1, 0.1)));
    bouncer.bounce();
    bouncer.update();

    //noFill();
    noStroke();
    fill(bouncer.col, 30);
    bouncer.draw();
  }
  
  if (frameCount % 3 == 0) createGif("daytwo");

}

void createGif(String name){
  saveFrame("data/" + name + ".####.png");
}
