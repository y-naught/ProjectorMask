void controllerChange(int channel, int number, int value){
   if(number == 48){
      red = value * 2; 
   }
   if(number == 49){
      green = value * 2; 
   }
   if(number == 50){
     blue = value * 2;
   }
   if(number == 51){
      numParticalsPF = int(map(value, 0, 127, 0, 1200)); 
   }
   if(number == 52){
      pSizeMax = map(value, 0 ,127, pSizeMin, 15);
   }
   if(number == 53){
      grav = map(value, 0, 127, -2.0, 2.0); 
   }
   if(number == 54){
      speedX = map(value, 0, 127, 0, 20); 
   }
   if(number == 55){
      speedY = map(value, 0, 127, 0, 20); 
   }
   if(number == 56){
      lfSp = int(map(value, 0, 127, 1, 20)); 
   }
}