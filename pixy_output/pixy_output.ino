//
// begin license header
//
// This file is part of Pixy CMUcam5 or "Pixy" for short
//
// All Pixy source code is provided under the terms of the
// GNU General Public License v2 (http://www.gnu.org/licenses/gpl-2.0.html).
// Those wishing to use Pixy source code, software and/or
// technologies under different licensing terms should contact us at
// cmucam@cs.cmu.edu. Such licensing terms are available for
// all portions of the Pixy codebase presented here.
//
// end license header
//

/* 
   06.04.2014 v0.1.3 John Leimon
     + Now using pixy.init() to initialize Pixy in setup().
*/

#include <SPI.h>  
#include <Pixy.h>

Pixy pixy;

int block1_x;
int block1_y;
int block2_x;
int block2_y;
int temp_block1_x = 0;
int temp_block1_y = 0;
int temp_block2_x = 0;
int temp_block2_y = 0;
int i = 0;
 
//these set of variables allows for the code to diffrentiate the blocks using width 
int tempWidth = 0;
int width1;
int width2;
  
void setup()
{

  Serial.begin(9600);
  Serial.print("Starting...\n");

  pixy.init();
}

void loop()
{ 
  static int i = 0;  ///block counter  
  int j;
  uint16_t blocks;    //unsigned 16-bit integer.
  char buf[32];  


  
  blocks = pixy.getBlocks();  // returns number of objects pixy has detected
  
  if (blocks)
  {

      for (j=0; j<blocks; j++){
        if (blocks == 2) {   //ensures that there are only data from 2 blocks 
          /*if (pixy.blocks[j].signature == 2) {
            block2_x = pixy.blocks[1].x;
            block2_y = pixy.blocks[1].y;
            temp_block2_x = block2_x;
            temp_block2_y = block2_y;
          }*/         //this portion was used when there are 2 signature inputs
          if (pixy.blocks[j].signature == 1) {
            width1 = pixy.blocks[0].width;
            width2 = pixy.blocks[1].width;
            
            if (width1 > width2) { /// the width comparison
              block1_x = pixy.blocks[0].x;
              block1_y = pixy.blocks[0].y;
              temp_block1_x = block1_x;
              temp_block1_y = block1_y;
              //this part is a modification such that the code reads and process 2 blocks of the same signature
              block2_x = pixy.blocks[1].x;
              block2_y = pixy.blocks[1].y;
              temp_block2_x = block2_x;
              temp_block2_y = block2_y;
            //---------------------------
            }
            else { // you swap it around
              block1_x = pixy.blocks[1].x;
              block1_y = pixy.blocks[1].y;
              temp_block1_x = block1_x;
              temp_block1_y = block1_y;
              //this part is a modification such that the code reads and process 2 blocks of the same signature
              block2_x = pixy.blocks[0].x;
              block2_y = pixy.blocks[0].y;
              temp_block2_x = block2_x;
              temp_block2_y = block2_y;
            //---------------------------
            }
          }
          else {
            Serial.println("Signature is neither 1 or 2");
          }
        }
        else {
          block2_x = temp_block2_x;
          block2_y = temp_block2_y;
          block1_x = temp_block1_x;
          block1_y = temp_block1_y;
        }
        sprintf(buf, "%d,%d,%d,%d,%d\n",blocks,block1_x,block1_y,block2_x,block2_y);
        Serial.print(buf); 
       // Serial.print(blocks + block1_x + block1_y + block2_x + block2_y);
        //pixy.blocks[j].print();
        //consider using 2 colours as signal 1 and signal 2  to differentiate top and bottom
      }
  }  
}

