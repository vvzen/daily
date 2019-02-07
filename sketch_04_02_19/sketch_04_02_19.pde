PImage img;

ArrayList<Pixel> crop;

public class Pixel {
  PVector pos;
  color col;
  Pixel(PVector pos, color col){
    this.pos = pos;
    this.col = col;
  }
}

void setup(){
  size(1024, 512);
  img = loadImage("rothko.png");
  frameRate(30);
  
  img.loadPixels();
  println("first pixel:" + img.pixels[0]);
}


void draw(){
  
  image(img, 0, 0);
  //translate(mouseX, mouseY);
  //color c = img.get(mouseX, mouseY);
  int cropSize = (int) random(10, 100);
  crop = getCrop(img, new PVector(random(width), random(height)), new PVector(cropSize, cropSize));
  
  pushMatrix();
  translate(width/2 + random(cropSize), random(cropSize));
  for (int i = 0; i < crop.size(); i++){
    Pixel pixel = crop.get(i);
    stroke(pixel.col);
    point(pixel.pos.x, pixel.pos.y);
  }
  popMatrix();
  
  //export("day_1_error");
}

ArrayList<Pixel> getCrop(PImage image, PVector origin, PVector crop){
  
  ArrayList<Pixel> croppedPixels = new ArrayList<Pixel>();
  
  image.loadPixels();
  
  for (int x = int(origin.x); x < int(origin.x) + crop.x; x++){
    for (int y = int(origin.y); y < int(origin.y) + crop.y; y++){
      //color col = image.pixels[x + y * int(crop.x)];
      color col = image.get(x,y);
      croppedPixels.add(new Pixel(new PVector(x, y), col));
    }
  }
  image.updatePixels();
  return croppedPixels;
}

void export(String name){
  saveFrame("data/" + name + ".####.png");
}
