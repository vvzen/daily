public class Pixel implements Comparable<Pixel> {
  PVector pos;
  color col;
  
  Pixel(color col){
    this.pos = new PVector(0, 0);
    this.col = col;
  }
  
  Pixel(PVector pos, color col){
    this.pos = pos;
    this.col = col;
  }
  
  public int compareTo(Pixel other){
     return (int) (brightness(this.col) - brightness(other.col));
  }
  
}
