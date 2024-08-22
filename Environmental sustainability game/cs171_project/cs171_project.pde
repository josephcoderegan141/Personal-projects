

//!! You may need to drag the image and sound files on to the source code for the code to work incase file not found errors occur!!


// Sound library by processing foundation
// I used the following code from the processing.org  to import sound
import processing.sound.*;
SoundFile gamemusic; // changed variable name from file to gamemusic



PImage cbin;                         //Stores information about the images (cs171 lab3)
PImage rbin;
PImage gbin;
PImage veg;
PImage bottles;
PImage carboard_b;
PImage background;

int score = 0;   //composte bin                    // stores the value of the three score counters for each individual bin
int score2 =0;   //recyling bin
int score3 = 0;  //general waste bin

int x1 = (int)random(550);//randomly spawns the fruit image on to the terminal
int y1 = (int)random(375);


int x2 = (int)random(550);//randomly spawns the bottle image on to the terminal
int y2 = (int)random(375);


int x3 = (int)random(550);//randomly spawns the box image on to the terminal
int y3 = (int)random(375);

boolean moving = false;   // will state if the fruit image is moving or not
boolean moving1 = false;    // will state if the bottle image is moving or not
boolean moving2 = false;     //will state if the box image is moving or not

int x = 0; // This variable allows only one item of rubbish to be inserted in to one specific bin
int gameover = 0;  // triggers game over code 
int screengo =10;   //game difficulty setting

void setup() {

  size(600, 600);// size of terminal
  cbin=loadImage("c.bin.jpg");     // load images into the GPU
  rbin=loadImage("rrbin.png");
  gbin=loadImage("download.png");
  veg=loadImage("vegtables.png");
  bottles=loadImage("bottle1.png");
  carboard_b=loadImage("carboard.png");
  background=loadImage("green background.png");
  frameRate(60); // sets framerate to 60

  //Sound file is Monkeys Spinning Monkeys (by Kevin MacLeod)
  // Downloaded from the website (https://www.chosic.com/)
  gamemusic = new SoundFile(this, "Monkeys-Spinning-Monkeys.mp3");
  gamemusic.loop(); // keeps music playing on a continous loop
}

void draw() {
  background(background); 
  image(cbin, 175, 525, 50, 75); //draws images
  image(rbin, 275, 525, 50, 75);
  image(gbin, 375, 525, 60, 75);
  textSize(18);// size of score counter text
  fill(0);// colour of text
  text("score " + score, 175, 525);// score counter above composte bin

  textSize(18); //size of the text
  fill(0);  // sets colour to black
  text("score " + score2, 275, 525);// score counter above recycling bin

  textSize(18);
  fill(0);
  text("score " + score3, 375, 525);// score counter above general waste bin


  frameRate(120);
  fill(0); // sets colour of text to black
  text("Don't let it reach "+screengo+"!", 20, 25); //text that references the score counter value and tells the player what value they must keep the counter under
  text("Pollution counter: "+gameover, 20, 50); // gameover int value that increases every 2 seconds

  ////////////////////////////////////////////////////FRUIT
  if (moving == true) {

    image(veg, mouseX-25, mouseY-25, 50, 50);    // if the boolean moving is true the fruit image co-ordinates gets mapped to MouseX and MouseY
    x=1; //moving fruit images set the value of x to one allowing them only to be dropped in to a bin that allows that value for x
  } else {//if the variable is not true spawn another random image on to the screen

    image(veg, x1, y1, 50, 50);
    if (frameCount%120 == 0) //image spawns at a random location after 2 seconds. I got the function frameCount from (processing.org)
    {
      x1 = (int)random(550);
      y1 = (int)random(375);
    }
  }
  /////////////////////////////////////////////////BOTTLES
  if (moving1 == true)
  {
    image( bottles, mouseX-25, mouseY-25, 50, 50);   // if the boolean moving1 is true the bottle image co-ordinates gets mapped to MouseX and MouseY
    x=2;
  } else
  {
    image( bottles, x2, y2, 50, 50);
    if (frameCount%120 == 0)
    {
      x2 = (int)random(550);
      y2 = (int)random(375);
    }
  }
  ////////////////////////////////////////////////CARDBOARD
  if (moving2 == true)
  {
    image( carboard_b, mouseX-25, mouseY-25, 50, 50);    // if the boolean moving2 is true the cardboard image co-ordinates gets mapped to MouseX and MouseY
    x=3;
  } else
  {
    image( carboard_b, x3, y3, 50, 50);
    if (frameCount%120 == 0)
    {
      x3 = (int)random(550);
      y3 = (int)random(375);
    }
  }

  // Game over function
  // After every two seconds the int value increases by 1
  // If the value of gameover reaches five the programe is going to stop running using the exit function
  // A black background is draw and then game over is pasted on to the screen
  // The player stops the game over function from running by placeing items of rubbish in to the correct bins decreasing the gameover value by 1
  if (frameCount%120 ==0) {

    gameover ++;
    print(gameover);

    if (gameover == screengo ) {

      frameRate(120);
      exit();           // stops the code from running (proccesing.org)
      background(0);
      textSize(50);
      fill(0, 0, 255);
      text("GAME OVER", 170, 300);
    }
  }
}

void mousePressed()
{
  println("X = "+mouseX+" Y = "+mouseY); // prints the co-ordinates of the mouses current location when clicked
  println();

  //  collision detection for the 3 images if the Mouse is clicked
  //  inside the image it will assume the mouseX and mouseY co-ordinates
  //  allowing it to be dragged
  if ((mouseX >= x1 && mouseX <= x1+50) && (mouseY >= y1 && mouseY <= y1+50))
  {


    // moving 1 is set to true while all the others are set to false allowing the fruit
    // image to be the only image that is moved when the mouse is clicked
    moving = true;
    moving1 = false;
    moving2 = false;
  }
  if ((mouseX >= x2 && mouseX <= x2+50) && (mouseY >= y2 && mouseY <= y2+50))
  {
    moving1 = true;
    moving = false;
    moving2 = false;
  }
  if ((mouseX >= x3 && mouseX <= x3+50) && (mouseY >= y3 && mouseY <= y3+50))
  {
    moving2 = true;
    moving1 = false;
    moving = false;
  }
}


void mouseReleased()
{

  // All booleans set to false as the images are no longer being dragged
  moving = false;
  moving1 = false;
  moving2 = false;

  // collision detection for if the mouse dragging an image has been released over the correct bin
  // the x value at the end of each if statement determines if its the correct bin or not

  if ((mouseX >= 175 && mouseX <= 175+50) && (mouseY>= 525 && mouseY<= 525+50 && x==1)) {


    score++;  //increases score counter above the composte bin by 1
    gameover--; //decreases gameover value by 1
  }

  if ((mouseX >= 275 && mouseX <= 275+50) && (mouseY >= 525 && mouseY <= 525+50 && x==2)) {


    score2++;
    gameover--;
  }

  if ((mouseX >= 375 && mouseX <= 375+50) && (mouseY >= 525 && mouseY <= 525+50 && x==3)) {


    score3++;
    gameover--;
  }
}


//References:
//processing.org, CS171 labs, www.chosic
