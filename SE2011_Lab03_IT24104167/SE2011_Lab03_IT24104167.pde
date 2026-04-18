float bx = 100;      
float by = 100;      
float bvx = 3;       
float bvy = 2;       
float bR = 20;       

// Mouse paddle
float pW = 80;       
float pH = 12;       
float pY;            

color ballColor = color(255, 100, 100);    
color paddleColor = color(100, 150, 255);  
color bgColor = color(245, 245, 250);      

void setup() {
  size(500, 400);
  frameRate(60);
  pY = height - 30;  
}

void draw() {
  background(bgColor);
  
  bx += bvx;
  by += bvy;
  
  if (bx > width - bR || bx < bR) {
    bvx *= -1;  // reverse x direction
  }
  if (by > height - bR || by < bR) {
    bvy *= -1;  // reverse y direction
  }

  float pX = constrain(mouseX - pW/2, 0, width - pW);
  if (by + bR > pY && bx > pX && bx < pX + pW) {
    bvy = -abs(bvy);  // bounce upward
    by = pY - bR;     // prevent sticking
  }

  noStroke();
  fill(paddleColor);
  rect(pX, pY, pW, pH);
  
  fill(ballColor);
  ellipse(bx, by, bR*2, bR*2);
  
  fill(180, 220, 180);
  ellipse(bx - 5, by - 5, 8, 8);
  
  fill(0);
  textSize(12);
  text("Move mouse to control paddle • Keep the ball bouncing!", 20, 20);
}
