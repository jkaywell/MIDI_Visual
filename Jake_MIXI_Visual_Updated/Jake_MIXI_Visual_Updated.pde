// Event Horizon Starter
// Zane Cochran
//modified by Jake R. Kaywell
// 27 March 2022
//Mod. 04 April 2022

//declare my variables
int circleX;
int circleY;
int circleD;
int xSpeed;
int ySpeed;
int xStart;
int yStart;
PImage psychedelic;

boolean isBroadcast = false;      // Toggles Visualization On/Off
String ipAddress = "10.40.4.115";  // Event Horizon IP Address

//initialize raindrop array
Raindrop[] raindrop = new Raindrop[600];

void setup(){
  size(480,480);
  initBroadcast();
  initAudio();
  //intitialize my bounce variables
circleX = width/2;
circleY = 50;
circleD = 100;
xSpeed = 5;
ySpeed = 5;
xStart = 30;
yStart = 30;
circleX = xStart;
circleY = yStart;
//raindrop effect for stage 2
for(int i = 0; i < raindrop.length; i++){
  raindrop [i] = new Raindrop(psychedelic);}
}

float whichColor = 0;
void draw(){
  broadcast();
  background(loadImage("psychedelic.png"));
  getLoud();
  //getWave();
  colorMode(HSB, 255);
  fill(255,255,255);
  circle(circleX, circleY, circleD);
  if(soundSize > 100){whichColor = random(255);}
  if(isBroadcast){broadcast();}
circleX = circleX + xSpeed;
circleY = circleY + ySpeed;

    
if (circleY == height){
  ySpeed = -5;
    
  }
if (circleY < 0){
ySpeed = 5;
    
  }
if (circleX == width){
xSpeed = -10;
  }
  
if (circleX < 0){
xSpeed = 5;
    
  }
        //for loop to initialize functions from raindrop class
  for(int i = 0; i < raindrop.length; i++){
    raindrop[i].render();
    raindrop[i].move();
    raindrop[i].reset();
  }
}
