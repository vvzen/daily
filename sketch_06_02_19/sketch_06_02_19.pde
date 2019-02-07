PImage img;

ArrayList<Pixel> newPixels;

float randomAmount = 0.0;

public class Pixel {
  PVector pos;
  color col;
  Pixel(PVector pos, color col){
    this.pos = pos;
    this.col = col;
  }
}

void setup(){
  size(512, 512);
  img = loadImage("rothko.png");
  frameRate(30);
  
  newPixels = new ArrayList<Pixel>();
  
  img.loadPixels();
  println("first pixel:" + img.pixels[0]);
  
  for (int x = 0; x < img.width; x++){
   for (int y = 0; y < img.height; y++){
     newPixels.add(new Pixel(new PVector(x, y), img.get(x, y)));
   }
  }
}


void draw(){
  background(0);
  //image(img, 0, 0);
  //println(frameCount);
  for (int i = 0; i < newPixels.size(); i++){
    Pixel p = newPixels.get(i);
    
    if (i > 0 && frameCount > 6){
      float oldR = red(p.col);
      float oldG = green(p.col);
      p.col += color(oldR, random(-randomAmount, randomAmount), oldG);
    }
    
    stroke(p.col);
    point(p.pos.x, p.pos.y);
  }
  
  randomAmount += 0.01;
  
  //export("day_3_error");
}

void export(String name){
  saveFrame("data/" + name + ".####.png");
}
