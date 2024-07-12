float ballX;
float ballY;
float speedX;
float speedY;
int hit;
int miss;
float paddle;
float distance;

void setup () {
  size (1000, 700);
  frameRate (24);
  ballX=30;
  ballY=0;
  speedX=20;
  speedY=5;
  hit=0;
  miss=0;
  paddle=100;
  distance=0;
}

void draw () {
  background (255);
  ellipse (ballX, ballY, 50, 50);
  if (ballX<25||ballX>width-25) {
    speedX=-speedX;
  }
  if (ballY>height-25) {
    speedY=-speedY;
    distance=abs(mouseX-ballX);

    if (distance<paddle) {
      hit = hit + 1;
    } else {
      miss = miss + 1;
    }
  } else {
    speedY=speedY + 1;
  }
  rect(mouseX-paddle, height-10, paddle*2,20);
  fill(0);
  textSize(40);
  text("Hit: " + hit,20,40);
  text("Miss: " + miss,20,80);

ballX = ballX + speedX;
ballY = ballY + speedY;
}
