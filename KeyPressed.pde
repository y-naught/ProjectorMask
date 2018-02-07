void keyPressed(){
 if(key == 'q'){
    if(bndSwitch){
      bndSwitch = false; 
    }else{
      bndSwitch = true;
    }
 }
 if(key == 'l'){
  if(bndSwitch){
    if(leftBnd >= 0){
    leftBnd += increment;
    }else{
     leftBnd  = 0;
    }
  }else{
    if(leftBnd >= 0){
    leftBnd -= increment;
    }else{
     leftBnd  = 0;
    }
  }
 }
 if(key == 'r'){
  if(bndSwitch){
    if(rightBnd <= 512){
    rightBnd += increment;
    }else{
     rightBnd  = 512;
    }
  }else{
    if(rightBnd <= 512){
    rightBnd -= increment;
    }else{
     rightBnd  = 512;
    }
  }
 }
 if(key == 't'){
  if(bndSwitch){
    if(topBnd >= 0){
    topBnd += increment;
    }else{
     topBnd  = 0;
    }
  }else{
    if(topBnd >= 0){
    topBnd -= increment;
    }else{
     topBnd = 0;
    }
  }
 }
 if(key == 'b'){
  if(bndSwitch){
    if(bottomBnd <= 424){
    bottomBnd += increment;
    }else{
     bottomBnd  = 424;
    }
  }else{
    if(bottomBnd <= 424){
    bottomBnd -= increment;
    }else{
     bottomBnd  = 424;
    }
  }
 }
 if(key == 'n'){
  if(bndSwitch){
    if(minBnd >= 0){
    minBnd += increment;
    }else{
     minBnd  = 0;
    }
  }else{
    if(minBnd >= 0){
    minBnd -= increment;
    }else{
     minBnd  = 0;
    }
  }
 }
 if(key == 'm'){
  if(bndSwitch){
    if(maxBnd <= 4500){
    maxBnd += increment;
    }else{
     maxBnd  = 4500;
    }
  }else{
    if(maxBnd <= 4500){
    maxBnd -= increment;
    }else{
     maxBnd  = 4500;
    }
  }
 }
 
 if(key == 's'){
    saveBnd(); 
 }
 if(key == 'w'){
    if(imageMode){
       imageMode = false; 
    }else{
       imageMode = true; 
    }
 }
}