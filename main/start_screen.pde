int circleSize = 205;

void startScreen() {
  background(255);
  wind = 0;
  gravity = G;
  dwind = 3;
  countDownTimer = gameTime;
  totalElapsedTime =  millis()/1000;
  totalElapsedTime2 = millis()/1000;   //// for the game start countdown
  newGame = true;
  
  //creates the start game circle
  fill(125);
  ellipse(width/2,height/2,circleSize,circleSize); 
  fill(255);
  ellipse(width/2,height/2,circleSize-10,circleSize-10); 
  //
  fill(color(61,150,45));
  ellipse(width/2,height/2,135,135); 
  fill(255);
  ellipse(width/2,height/2,130,130); 
  fill(lerpColor(color(97,255,69),color(44,105,33),sqrt(sq(mouseX-width/2)+sq(mouseY-height/2))/(width/2)));
  ellipse(width/2,height/2,120,120);  
  fill(255);
  ellipse(width/2,height/2,90,90);
  
  //draws title
  tint(255,255);
  imageMode(CENTER);
  title.resize(0,150);
  image(title,width/2,100);
  
  //creates the arrow
  imageMode(CORNER);
  
  arrowL.resize(100,50);
  image(arrowL,width/2-200,height/2-30);
  arrowR.resize(100,50);
  image(arrowR,width/2+100,height/2-30);
 
  //instructions
  tint(255,100);
  imageMode(CENTER);
  startScreen1.resize(0,150);
  image(startScreen1,width/2,height-100);
  
  
  if (Score.total != 0)
    Score.lastScore = Score.total;
  Score.total = 0;
  textFont(f,40);                 // default font to be used
  fill(0);                        //default font color 
  textAlign(CENTER);
  text("START" ,width/2,height/2-130);  // Display Text
  textFont(f,30); 
  text("HIGH Score: " + Score.highScore,width/2,height/2+190);  // Display Text
  text("YOUR Score: " + Score.lastScore,width/2,height/2+140);  // Display Text
  
  //---choose---//
  mousePlay();
 //createMouth();
 
 //for mouse
 if (((height/2) < (mouseY+10)) && ((height/2) > (mouseY-10))) {
   if (((width/2) < (mouseX+10)) && ((width/2) > (mouseX-10))){
     if (isMouthOpened)
       circleAnim(2);
   }
 }
 
 //for motion capture
 /*
  if (((height/2) < (mouthCoordinateY()+10)) && ((height/2) > (mouthCoordinateY()-10))) {
   if (((width/2) < (mouthCoordinateX()+10)) && ((width/2) > (mouthCoordinateX()-10))){
     if (isMouthOpened)
       menu = 2;
   }
 }*/
}

void pauseScreen() {
  textFont(f,60);                 
  fill(0);   
  textAlign(CENTER);
  text("Game Paused\n Press Y to return"  ,width/2,height/2);  // Display Text
}

void gameOverScreen() {
  background(255);
  
  fill(125);
  ellipse(width/2,height/2+200,circleSize,circleSize); 
  fill(255);
  ellipse(width/2,height/2+200,circleSize-10,circleSize-10); 
  //
  fill(color(61,150,45));
  ellipse(width/2,height/2+200,135,135); 
  fill(255);
  ellipse(width/2,height/2+200,130,130); 
  fill(lerpColor(color(97,255,69),color(44,105,33),sqrt(sq(mouseX-width/2)+sq(mouseY-height/2))/(width/2)));
  ellipse(width/2,height/2+200,120,120);  
  fill(255);
  ellipse(width/2,height/2+200,90,90);
  
  textFont(f,100);                 
  fill(0);                        
  textAlign(CENTER);
  text("GAME OVER" ,width/2,height/2-130);  // Display Text
  textFont(f,30); 
  text("HIGH Score: " + Score.highScore,width/2,height/2+10);  // Display Text
  text("YOUR Score: " + Score.lastScore,width/2,height/2+60);  // Display Text
  allSpawn.clear();
  spawnCounter = 0;
  countDownTimer = gameTime;
  wind = 0;
  Score.total = 0;
  
  mousePlay();
  
 //for mouse
 if (((height/2+200) < (mouseY+10)) && ((height/2+200) > (mouseY-10))) {
   if (((width/2) < (mouseX+10)) && ((width/2) > (mouseX-10))){
     if (isMouthOpened)
       circleAnim(1);
   }
 }
 
 //for motion capture
 /*
  if (((height/2+200) < (mouthCoordinateY()+10)) && ((height/2+200) > (mouthCoordinateY()-10))) {
   if (((width/2) < (mouthCoordinateX()+10)) && ((width/2) > (mouthCoordinateX()-10))){
     if (isMouthOpened)
       menu = 2;
   }
 }*/
}

void circleAnim(int i) {
  circleSize -=2;
  if (circleSize <=135) {
    menu = i;
    circleSize = 205;
  }
}
