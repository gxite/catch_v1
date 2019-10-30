class Spawn {
 int sizeOfSpawn;
 PVector posOfSpawn = new PVector();
 int spawnIdentity;
 
 Spawn(int size,int id) {
   sizeOfSpawn = size;
   posOfSpawn.x = randomIntGen(60,width-60);
   posOfSpawn.y = randomIntGen(0,150);
   spawnIdentity = id;
 }
 
 void move() { 
   
   switch (spawnIdentity) {
     case 1: fill(lerpColor(color(82,193,58), color(225,82,95), (posOfSpawn.y-50)/height*1f));
             strokeWeight(2);
             stroke(255);
             ellipse(posOfSpawn.x,posOfSpawn.y,sizeOfSpawn,sizeOfSpawn);
             break;
     case 2: fill(color(225,82,95));
             strokeWeight(2);
             stroke(255);
             ellipse(posOfSpawn.x,posOfSpawn.y,sizeOfSpawn,sizeOfSpawn);
             break;
     case 3: fill(lerpColor(color(26,181,162), color(225,255,255), (posOfSpawn.y-50)/height*1f)); 
             ellipse(posOfSpawn.x,posOfSpawn.y,sizeOfSpawn+20,sizeOfSpawn+20);
             fill(255);
             ellipse(posOfSpawn.x,posOfSpawn.y,sizeOfSpawn+10,sizeOfSpawn+10);    
             fill(lerpColor(color(26,181,162), color(225,82,95), (posOfSpawn.y-50)/height*1f)); 
             ellipse(posOfSpawn.x,posOfSpawn.y,sizeOfSpawn,sizeOfSpawn);
             break;
   }
   
   posOfSpawn.y += gravity; //gravity variable is in game level control
   posOfSpawn.x += wind;
 }
 
 void mouthCatch(int i) {
   if (isCaught()) {
     switch (allSpawn.get(i).spawnIdentity) {
       case 1: Score.scoreAdd(1); break;
       case 2: Score.scoreAdd(-10); break;
       case 3: Score.scoreAdd(15); break;
     }
     allSpawn.remove(i);
   }
 }
 
 void flushSpawn(int i) {
   if (isEndOfScreen(i))
     allSpawn.remove(i);
 }
 
 boolean isEndOfScreen(int i) {
   if(allSpawn.get(i).posOfSpawn.y > height)
     return true;
   else 
     return false;
 }
 
 boolean isCaught() {
   // for mouse    ---- note! have to change mouth size in debug mouth
    if (isMouthOpened) {
     if ((posOfSpawn.y < (mouseY+(sizeOfSpawn-20))) && (posOfSpawn.y > (mouseY-(sizeOfSpawn-20)))) {
       if ((posOfSpawn.x < (mouseX+(sizeOfSpawn-20))) && (posOfSpawn.x > (mouseX-(sizeOfSpawn-20)))) {
         return true;
       }
     }
   }
  // for motion capture
 /*if (isMouthOpened) {
     if ((posOfSpawn.y < (mouthCoordinateY()+(sizeOfMouth-40))) && (posOfSpawn.y > (mouthCoordinateY()-(sizeOfMouth-40)))) {
       if ((posOfSpawn.x < (mouthCoordinateX()+(sizeOfMouth-40))) && (posOfSpawn.x > (mouthCoordinateX()-(sizeOfMouth-40)))) {
         return true;
       }
     }
  }*/
    return false;
    
 }

}
