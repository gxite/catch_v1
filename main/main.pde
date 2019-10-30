import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import processing.serial.*;  // Import Serial class library

Serial myPort;  // Create object from Serial class
Minim minim;
AudioSnippet pipe;
AudioSnippet gunshot;
AudioSnippet windHowl;
PImage arrowL;
PImage arrowR;
PImage title;
PImage startScreen1;
PImage startScreen2;
PImage open;
PImage close;

//menu variables
int menu = 1;

void setup() {
  frameRate(800);   //frame raate cannot be too low otherwise tracking will lag
  size(1500,900);
  lipTop = new PVector(width/2,height/2);
  lipBottom = new PVector(width/2,height/2);

  arrowL = loadImage("Images/arrowL.png");
  arrowR = loadImage("Images/arrowR.png");
  title = loadImage("Images/title.png");
  startScreen1 = loadImage("Images/startScreen1.png");
  startScreen2 = loadImage("Images/startScreen2.png");
  open = loadImage("Images/open.png");
  open.resize(sizeOfMouth,0);
  close = loadImage("Images/close.png");
  close.resize(sizeOfMouth,0);
  
  String portName = "COM4";
 /* myPort = new Serial(this,portName,9600);
  myPort.bufferUntil('\n');
  */
  f = createFont("LetterGothicStd-Bold",16,true); //anti-aliasing on
  fontTimer = 0; 
  fontAnim = false;
  
  //sound
  // An AudioPlayer object is used to store the sound.
  minim  = new Minim(this);
  pipe = minim.loadSnippet("Sound/hitpipe.wav"); 
  gunshot = minim.loadSnippet("Sound/pistol-02.wav"); 
  windHowl = minim.loadSnippet("Sound/wind-howl-02.wav");
}

void draw() {
  switch (menu) {
   case 1: allSpawn.clear();
           startScreen();
           break;
   case 2: gameScreen(); break;
   case 3: pauseScreen();break;
   case 4: allSpawn.clear();
           gameOverScreen();break;
   }
}

void keyPressed() { //debug spawn
 if (key == 'a') 
  allSpawn.add(new Spawn(50,1)); //type 1 is blue, adds to total score
 if (key == 's') 
  allSpawn.add(new Spawn(50,2)); // type 2 is red, subtracts from total score
 if (key == 'n') 
  menu = 1; // type 2 is red, subtracts from total score
 if (key == 'y') { 
  menu = 2; // type 2 is red, subtracts from total score
 }
  if (key == 'p') 
  menu = 3; 
  if (key == 'z') 
  menu = 4; 
    
}
