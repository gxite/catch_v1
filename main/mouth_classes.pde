PVector lipTop,lipBottom;
PVector lipSize = new PVector(100,20);
String str;
int i = 0;
//stores temp values
int xTemp = 0;
int yTemp = 0; 
//for debug 
boolean isMouthOpened = false;
int sizeOfMouth = 100;

void setPos(String _str){   /// this is important as it dynamically sets the lips global variables
  String[] values;
  String s = _str; 
    
    if(s != null){ 
      values = s.split(",");
      
      //sets the positions of the lips
     try {
      lipTop.x = width-map(float(values[1]),0,319,0,width);
      lipTop.y = map(float(values[2]),0,199,0,height);
      lipBottom.x = width-map(float(values[3]),0,319,0,width);
      lipBottom.y = map(float(values[4]),0,199,0,height);
     }
     catch (ArrayIndexOutOfBoundsException e) {
        println("ArrayIndexOutOfBoundsException");
        return;
     }
     catch (IndexOutOfBoundsException e) {
        println("IndexOutOfBoundsException");
        return;
     }
  }
}

boolean checkIfOpened(PVector top, PVector bottom) {
    int threshold = 100; ///key value in determining the "closed" distance between the trackers
    int difference = int(abs(top.y-bottom.y));
    
    if (difference <= threshold) {
     return false; 
    }
    else {
     return true; 
    }  
}

void createMouth() {
  //for debug ... helps to identify the position of the neon markers to adjust threshold
  /*fill(color(255,0,0));
  rect(lipTop.x,lipTop.y,lipSize.x,lipSize.y);
  fill(color(0,255,0));
  rect(lipBottom.x,lipBottom.y,lipSize.x,lipSize.y); 
 */
  
  color c = color(255,98,13);
  color c2 = /*color(255,157,0)*/color(0);
  isMouthOpened = false;
  
  //this controls the max and min size of the mouth
  sizeOfMouth = 50;
  
  if (menu == 1) {
    c = lerpColor(color(97,255,69),color(44,105,33),sqrt(sq(mouthCoordinateX()-width/2)+sq(mouthCoordinateY()-height/2))/(width/2));
    c2 = lerpColor(color(97,255,69),color(44,105,33),sqrt(sq(mouthCoordinateX()-width/2)+sq(mouthCoordinateY()-height/2))/(width/2));
    if (checkIfOpened(lipTop,lipBottom)) {
      c2 = color(0,255,34);
      c = color(0,255,34);
      isMouthOpened = true;
      sizeOfMouth = 80;
    }
  }
  else if (menu == 4) {
     c = lerpColor(color(97,255,69),color(44,105,33),sqrt(sq(mouthCoordinateX()-width/2)+sq(mouthCoordinateY()-height/2))/(width/2));
    c2 = lerpColor(color(97,255,69),color(44,105,33),sqrt(sq(mouthCoordinateX()-width/2)+sq(mouthCoordinateY()-height/2))/(width/2));
    if (checkIfOpened(lipTop,lipBottom)) {
      c2 = color(0,255,34);
      c = color(0,255,34);
      isMouthOpened = true;
      sizeOfMouth = 80;
    }
  }
  else {
  if (checkIfOpened(lipTop,lipBottom)) {
    c = color(75,255,61);
    c2 = /*color(93,232,86)*/ color(0);
    isMouthOpened = true;   //this is an veryfiying value in determining caught
    sizeOfMouth = 80;
  }
  }
  //creates the ring
  fill(c);
  ellipse(lipTop.x,lipTop.y,sizeOfMouth,sizeOfMouth);
  fill(c2);
  ellipse(lipTop.x,lipTop.y,sizeOfMouth-10,sizeOfMouth-10); 
}

int mouthCoordinateX() {
  return (int)((lipTop.x + lipBottom.x)/2); 
}

int mouthCoordinateY() {
  return (int)((lipTop.y + lipBottom.y)/2); 
}


void mousePlay() {
  color c = color(255,98,13);
  color c2 = color(255);
  isMouthOpened = false;
  int size = 50;
  
  if (menu == 2) {
   tint(255,255);
  image(close,mouseX,mouseY);
  }
  
  if (menu == 1) {
    c = lerpColor(color(97,255,69),color(44,105,33),sqrt(sq(mouseX-width/2)+sq(mouseY-height/2))/(width/2));
    c2 = lerpColor(color(97,255,69),color(44,105,33),sqrt(sq(mouseX-width/2)+sq(mouseY-height/2))/(width/2));
    if (mousePressed) {
      c2 = color(0,255,34);
      c = color(0,255,34);
      isMouthOpened = true;
      size = 80;
    }
  }
  else if (menu ==4) {
    c = lerpColor(color(97,255,69),color(44,105,33),sqrt(sq(mouseX-width/2)+sq(mouseY-height/2))/(width/2));
    c2 = lerpColor(color(97,255,69),color(44,105,33),sqrt(sq(mouseX-width/2)+sq(mouseY-height/2))/(width/2));
    if (mousePressed) {
      c2 = color(0,255,34);
      c = color(0,255,34);
      isMouthOpened = true;
      size = 80;
    }
  }
  else {
    if (mousePressed) {
     /* c = color(75,255,61);
      c2 = color(255);
      size = 60;
      */
      fill(255);
      ellipse(mouseX,mouseY,sizeOfMouth,sizeOfMouth);  
      image(open,mouseX,mouseY);
      isMouthOpened = true;
    }
  }
  
  //creates a ring
  if ((menu == 1) || (menu == 4)) {
    noStroke();
    fill(c);
    ellipse(mouseX,mouseY,size,size);  
    fill(c2);
    ellipse(mouseX,mouseY,size-10,size-10);
  }
  
}
