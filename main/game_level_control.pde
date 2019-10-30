final int G = 1;

int fCounterMax = 800;  //noe the frame rate set in he setup is 800 frames/s
int gravity = G; //sets the speed of fall
int bombRate = 200; // controls the frequency of bombs, cannot be larger than fCounterMax
int spawnRate = 100;
int wind = 0; //initialise wind as 0 
int dwind = 1;
int spawnCounter = 0;
int frameCounter = 0;
int gameTime = 60;

void autoSpawn(int fCounter) {
 if ((fCounter % spawnRate) == 0) {
  for (int i=0; i<2; i++) {   
    allSpawn.add(new Spawn(60,1)); //type 1 is blue, adds to total score
    spawnCounter++; //adds a count
  }
 }
 
 if ((((fCounter-150) % bombRate) == 0) || (((fCounter) % bombRate) == 0)) {
  for (int i=0; i<3; i++) {
    allSpawn.add(new Spawn(50,2)); // type 2 is red, subtracts from total score
    spawnCounter++; //adds a count
  }
 }
 
 if (spawnCounter == 50) {
    allSpawn.add(new Spawn(50,3)); // type 3 is orange, add 10 to total score
    spawnCounter = 0;
 }
 
 if (fCounter == fCounterMax)
   frameCounter = 0;
}

int randomIntGen(int lowerLimit, int upperLimit) {
   return (int)random((float)lowerLimit, (float)upperLimit);
 }
 
void windChange() {
  wind = randomIntGen(-dwind,dwind);
}
