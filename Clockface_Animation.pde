float x = 0;
float y = 0;

float sec = second();
float min = minute();
float hr = hour();

long  secM = 0;
float minM = 0;
float hrM = 0;





void setup()
{
  size(500, 500);
  
  frameRate(60);
}



  
void draw() 
{
  background(50);
  
  translate(width / 2, height / 2);
  rotate(radians(-90));
  
  stroke(255, 255, 255);
  fill(0);
  circle(0, 0, width * 0.95);

  drawNumb();  

  drawArrows();
  
  timeUpdate();
}



void timeUpdate()
{
  sec += (millis() - secM) / (float) 1000;
  secM = millis();

  min += (sec - minM) / (float) 60;
  minM = sec;
  
  hr += (min - hrM) / (float) 60;
  hrM = min;
  
  if(sec > 60)
  {
    sec -= 60;
    minM = minM - 60;
  }
  
  if(min > 60)
  {
    min -= 60;
    hrM -= 60;
  }
    
  if(hr > 12)
  {
    hr -= 12;
  }
}



void drawNumb()
{
  int deg = -60;
  rotate(radians(90));
  textSize(32);
    
  for(int i = 1; i <= 12; i ++)
  {
    getXY(deg, width * 0.8);
    
    fill(180);
    
    if(((sec / 5) < i + 0.07 && (sec / 5) > i - 0.07) || ((sec / 5) > 59.93 && (sec / 5 < 0.07  && i == 12)))
      fill(255, 0, 0);
    else
      fill(180);
    
    text(i, x - 16, y + 16);
    deg += 30;
  }
  
  strokeWeight(5);
  stroke(255, 255, 0);
  noFill();
  ellipse(0, 0, 900, 900);

  rotate(radians(-90));
}



void drawArrows()
{
  getXY(30 * hr, width * 0.45);
  stroke(0, 0, 255);
  strokeWeight(13);
  line(0, 0, x, y);
  
  getXY(6 * min, width * 0.6);
  stroke(0, 255, 0);
  strokeWeight(7);
  line(0, 0, x, y);
  
  getXY(6 * sec, width * 0.72);
  stroke(255, 0, 0);
  strokeWeight(3);
  line(0, 0, x, y);
  
  fill(255, 0, 0);
  ellipse(x, y, 10, 10);
  fill(255, 0, 0);
  ellipse(0, 0, 20, 20);
  
}



void getXY(float ang, float dia)
{
  while(ang > 360)
    ang -= 360;
    
  float tg = tan(radians(ang));
  
  x = dia / 2 / sqrt(tg * tg + 1);
  y = tg * x;
  
  if(ang >= 90 && ang < 270)
  {
    x = -x;
    y = -y;
  }
}
