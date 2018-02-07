class Partical{
   
  PVector location;
  PVector velocity;
  PVector gravity;
  int col;
  float size;
  float spX;
  float spY;
  int lifeSpan;
  int firstFrame;
  
  Partical(int x, int y, int c, float s, PVector gr, float tmpSpX, float tmpSpY, int tmpLifeSpan){
    spX = tmpSpX;
    spY = tmpSpY;
    location = new PVector(x, y);
    velocity = new PVector(random(-spX, spX), random(-spY, spY));
    gravity = new PVector(0, 0.3);
    col = c;
    size = s;
    firstFrame = frameCount;
    lifeSpan = tmpLifeSpan;
  }
  
  void update(){
      velocity.add(gravity);
      location.add(velocity);
  }
  
  void display(){
      noStroke();
      fill(col);
      ellipse(location.x, location.y, size, size);
  }
  
  boolean isDead(){
      if(frameCount - firstFrame > lifeSpan){
         return true; 
      }else{
         return false; 
      }
  }
}