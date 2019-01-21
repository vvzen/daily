public class Bouncer {
  
  PVector pos, vel, acc;
  int radius;
  final float bounceFactor = 5.0;
  color col;
  
  Bouncer(PVector pos, int radius, color col){
    this.pos = pos;
    this.vel = new PVector(0, 0);
    this.acc = new PVector(0, 0);
    this.col = col;
    this.radius = radius;
  }
  
  void addForce(PVector force){
    this.acc.x += force.x;
    this.acc.y += force.y;
  }
  
  void bounce(){
    if (this.pos.x > width){
      addForce(new PVector(-bounceFactor, 0));
    }
    else if (this.pos.x < 0){
      addForce(new PVector(bounceFactor, 0));
    }
    else if (this.pos.y > height){
      addForce(new PVector(0, -bounceFactor));
    }
    else if (this.pos.y < 0){
      addForce(new PVector(0, bounceFactor));
    }
  }
  
  void update(){
    
    this.vel.x += this.acc.x;
    this.vel.y += this.acc.y;
    
    if (this.vel.x > 1 || this.vel.x < -1){
      this.vel.x *= 0.9;
    }
    if (this.vel.y > 1 || this.vel.y < -1){
      this.vel.y *= 0.9;
    }
    
    this.radius = int(map(this.vel.mag(), 0, 10, 20, 8)); 


    this.pos.x += this.vel.x;
    this.pos.y += this.vel.y;
    
    this.acc.x = 0;
    this.acc.y = 0;
  }
  
  void draw(){
    ellipse(pos.x, pos.y, radius, radius);
  }
}
