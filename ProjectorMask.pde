import KinectPV2.*;
import themidibus.*;

KinectPV2 kinect;
MidiBus bus;

float speedX = 0;
float speedY = 0;

int lfSp = 0;

int red = 0;
int green = 0;
int blue = 0;

float grav = 0;

float pSizeMin = 4;
float pSizeMax = 7;

ArrayList<Partical> fountain;

IntList logX = new IntList();
IntList logY = new IntList();

boolean imageMode = false;

//boundaries
boolean bndSwitch = false;
int leftBnd = 0;
int rightBnd = 512;
int topBnd = 0;
int bottomBnd = 424;
int minBnd = 0;
int maxBnd = 4500;
int increment = 10;


int numParticalsPF = 1000;

float stretchFactorX = 1.2;

int humanOffset = 200;

void setup(){
  fullScreen(P3D, 2);
  bus = new MidiBus(this, "APC MINI", "APC MINI");
  
  loadBnd();
  kinect = new KinectPV2(this);
  
  kinect.enableDepthImg(true);
  kinect.enablePointCloud(true);
  
  kinect.init();
  fountain = new ArrayList<Partical>();
}

void draw(){
  background(0);
  PImage img = createImage(512, 424, RGB);
  boolean tfImage[] = new boolean[512 * 424];
  int rawData[] = kinect.getRawDepthData();
  
  img.loadPixels();
  for(int i = leftBnd; i < rightBnd; i++){
    for(int j = topBnd; j < bottomBnd; j++){
      int arrayLoc = i + j * 512;
      if(rawData[arrayLoc] > minBnd && rawData[arrayLoc] < maxBnd){
        tfImage[arrayLoc] = true;
        logX.append(i);
        logY.append(j);

      }else{
        tfImage[arrayLoc] = false;
      }
    }
  }
  
  if(imageMode){
    img.loadPixels();
      for(int i = leftBnd; i < rightBnd; i++){
         for(int j = topBnd; j < bottomBnd; j++){
             int arrayLoc = i + j * 512;
             if(tfImage[arrayLoc]){
                 img.pixels[arrayLoc] = color(255,255,255);
             }else{
                img.pixels[arrayLoc] = 0; 
             }
         }
      }
      img.updatePixels();
  }
  
  float avgLocX = 0;
  float avgLocY = 0;
  int count = 0;
  for(int i = leftBnd; i < rightBnd; i++){
     for(int j = topBnd; j < bottomBnd; j++){
       int arrayLoc = i + j * 512;
         if(tfImage[arrayLoc]){
             avgLocX += i;
             avgLocY += j;
             count++;
         }
     }
  }
  
  //PVector loc = new PVector(map(avgLocX / count, 0, 512, -50, 562), avgLocY / count);
  
  //if(!imageMode){
  //    ellipse(width - (loc.x * width / 512), (loc.y * width / 424) - humanOffset, 400, 1000);
  //}
  
  
  //if(imageMode){
  //  img.updatePixels();
  //  img.resize(width, height);
  //  pushMatrix();
  //  //translate(width, 0);
  //  //scale(-1, 1);
  //  image(img, 0, 0);
  //  popMatrix();
  //}

if(logX.size() > 0){
  for(int i = 0; i < numParticalsPF; i++){
      int seed = int(random(logX.size()));
      //println(logX.size());
      fountain.add(new Partical(int(map(logX.get(seed), 0 , 512, 0, width)), int(map(logY.get(seed), 0, 424, 0, height)), color(random(red), random(green), random(blue)), random(pSizeMin, pSizeMax), new PVector(0, grav) ,speedX, speedY, lfSp));
  }
  
  for(int i = 0; i < fountain.size(); i++){
     Partical p = fountain.get(i); 
     if(p.isDead()){
         fountain.remove(i);
     }else{
        p.update();
        p.display();
     }
  }
  
  logX.clear();
  logY.clear();
}
}