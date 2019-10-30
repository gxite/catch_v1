//----global gameplay variables ----//
ArrayList<Spawn> allSpawn = new ArrayList<Spawn>();
PFont f; //font for in game display
int fontTimer = 0;
boolean fontAnim;
int countDownTimer = gameTime; //for some reason the timer starts with 1 seconds subtracted ..might be reaction time
int elapsedTime = 0;
int elapsedTime2 = 0;
int totalElapsedTime = 0;
int totalElapsedTime2 = 0;
boolean newGame = true;



void gameScreen() {
  
  //background white
  background(255);  
  
  if (newGame) {
    countDown();
    return;
  }
  
  //updates elapsedTime 
    elapsedTime = millis()/1000 - totalElapsedTime;
  if ((countDownTimer-elapsedTime) == -1) {
    menu = 4;
    countDownTimer = gameTime;
    Score.lastScore = Score.total;
    return;                                 ///exit when game overy
  }  
 

  //draws an indicator rectangle on the top left corner
  /*if ((lipTop != null) && (lipBottom != null)) { ///impt line otherwise array out of bound exception
   if (checkIfOpened(lipTop,lipBottom)) {
    fill(color(0,255,0));
    rect(0,0,50,50);
   } 
   else {
    fill(color(255,255,255));
    rect(0,0,50,50);
   }   
  } */
   
  
  /*if (myPort.available() > 0) {  // If data is available,
    str = myPort.readStringUntil('\n');         // read it and store it in val
    if(str != null){
      setPos(str);    
    }
  }
  */
  
 
   //---------------------------------------Motion Caputure/Mouse Control --------------------------//
   //createMouth();   //motion capture
   mousePlay();   //mouse
   //-----------------------------------------------------------------------------------------------//
  
   //this portion controls the movement of the balls and sound effects for the balls
   for(int i = 0; i < allSpawn.size(); i++){
    allSpawn.get(i).move();
    if (allSpawn.get(i).isCaught()) {
      if (allSpawn.get(i).spawnIdentity == 2) {
        fontAnim = true;
        if (!gunshot.isPlaying()) {
            gunshot.rewind(); // The ring() function plays the sound, as long as it is not already playing. 
            gunshot.play(); // rewind() ensures the sound starts from the beginning.
        }
      }
      else {
        if (!pipe.isPlaying()) {
          pipe.rewind(); // The ring() function plays the sound, as long as it is not already playing. 
          pipe.play(); // rewind() ensures the sound starts from the beginning.
        }
      }
    }
    //this verifies if the balls are caught
    allSpawn.get(i).mouthCatch(i);
    // this verifies if the balls are out of screen
    try {
      allSpawn.get(i).flushSpawn(i);
    }
    catch (IndexOutOfBoundsException ex) {
      println("IndexOutOfBoundsException");
      return;
    }
   }
   
   //draws the timer and score border
  noStroke();
  fill(0);
  ellipse(width-200,height-190,230,230);  
  fill(255);
  ellipse(width-200,height-190,220,220);
  
  //displays the score board
  textFont(f,25);                 // default font to be used
  fill(0);                        //default font color  
  //animates the score counter
  if (fontAnim) {
    fontTimer++;
    if ((fontTimer % 2) == 0) {
      fill(color(255,0,0));
      textFont(f,40); 
    }
    if (fontTimer == 50) {
      fontAnim = false;
      fontTimer = 0;
    }
  }
  //score
  text("Score: " + Score.getTotalScore(),width-200,height-150); 
  //timer 
  text("Time Left: " + (countDownTimer-elapsedTime),width-200,height-200); 
   
   
   ////////////////////////////////////---------------------------------------------------------mid way pause 
    if ((countDownTimer-elapsedTime)<35) {
      midwayPause(countDownTimer-elapsedTime);
    }
    
  //spawns automatically
  autoSpawn(frameCounter);
  if(((spawnCounter % 10) == 0) && (spawnCounter != 0)) {
    if (!windHowl.isPlaying()) {
            windHowl.rewind(); // The ring() function plays the sound, as long as it is not already playing. 
            windHowl.play(); // rewind() ensures the sound starts from the beginning.
        }
    windChange();
  }
  frameCounter++;
  
}

void countDown() {
  int timer = 5;
  elapsedTime2 = millis()/1000 - totalElapsedTime2;
  textFont(f,60);                 
  fill(0);   
  textAlign(CENTER);
  println(timer-elapsedTime2);
  if ((timer-elapsedTime2) == 0) {
    newGame = false;
    totalElapsedTime2 = millis()/1000;
    gameScreen();
  }
  else {
  text("COMMENCING ...",width/2,height/2-50);  // Display Text
  textFont(f,80);
  fill(0);
  ellipse(width/2,height/2+65,90,90);  
  fill(255);
  ellipse(width/2,height/2+65,80,80);
  fill(0);
  text(timer-elapsedTime2 ,width/2,height/2+90);  
  }
}

void midwayPause(int i) {
  if (i>30) {
      textFont(f,60);                 
      fill(0);   
      textAlign(CENTER);
      text("Too Easy? ",width/2,height/2);
  }
  if (i<30) {
   gravity = 2;
   dwind = 2;  
  }
  if ((i>13) && (i<15) ) {
     textFont(f,80);                 
     fill(0);   
     textAlign(CENTER);
     text("Final Push! ",width/2,height/2);
  }
  if (i<12) {
   gravity = 2;
   dwind = 3;
  }
}
