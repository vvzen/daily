import java.util.Collections;
import java.util.List;

float errorAmount = 0.01;

PImage img;
ArrayList<Pixel> imagePixels;

void setup(){
  size(512, 512);
  
  imagePixels = new ArrayList<Pixel>();
  
  img = loadImage("rothko.png");
  frameRate(30);
  
  image(img, 0, 0);
  img.loadPixels();
  println("first image pixel: " + img.pixels[20]);
  //for (int p = 0; p < img.width * img.height; p++){
    
  //  imagePixels.add(new Pixel(img.pixels[p]));
  //}
  
  for (int x = 0; x < img.width; x++){
    for (int y = 0; y < img.height; y++){
      imagePixels.add(new Pixel(new PVector(x, y), img.get(x, y)));
      //imagePixels.add(new Pixel(new PVector(x + random(-10, 10), y + random(-100, 100)), img.get(x, y)));
    }
  }
  img.updatePixels();
  
  println("our first pixel: " + imagePixels.get(0));
  
  Collections.sort(imagePixels);
}


void draw(){
  //image(img, 0, 0);
  
  //translate(width/2, 0);
  
  for (int i = 0; i < imagePixels.size(); i++){
    Pixel p = imagePixels.get(i);
    stroke(p.col);
    point(p.pos.x, p.pos.y);
    p.pos.x += random(-errorAmount, errorAmount);
    p.pos.y += random(-errorAmount, errorAmount);
  }
  
  //text(frameRate, 20, 20);
  export("day_2_error");
  
  errorAmount += 0.1;
}

void export(String name){
  saveFrame("data/" + name + ".####.png");
}
