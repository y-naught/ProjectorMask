void loadBnd(){
    String[] values = loadStrings("bound.txt");
    
    leftBnd = int(values[0]);
    rightBnd = int(values[1]);
    topBnd = int(values[2]);
    bottomBnd = int(values[3]);
    minBnd = int(values[4]);
    maxBnd = int(values[5]);
}

void saveBnd(){
   PrintWriter bndOut = createWriter("bound.txt"); 
   bndOut.println(leftBnd);
   bndOut.println(rightBnd);
   bndOut.println(topBnd);
   bndOut.println(bottomBnd);
   bndOut.println(minBnd);
   bndOut.println(maxBnd);
   bndOut.flush();
   bndOut.close();
}