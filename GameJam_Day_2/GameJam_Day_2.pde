import processing.sound.*;
SoundFile file;
PImage vipes;
PImage claw;
PImage speech1;
PImage speech2;
PImage laser;
PImage mark;
PImage over;
PImage vict;
int x=1400;
int y=350;
int x2=10;
int y2=320;
int x4=1400;
int y4=250;
int x3= 170;
int y3= 150;
int x5= 1200;
int y5= 380;
int x6= 20;
int y6= 330;
int w= 350;
int h=350;
int w2= 350;
int h2= 350;
boolean speech1isAlive = true;
boolean speech2isAlive = true;
boolean markisAlive= false;
boolean laserisAlive= false;
Weapon Laser;

void setup()
{
  fullScreen();
  vipes= loadImage("Viper.png");
  claw=loadImage("Wolverine.png");
  speech1=loadImage("Bubble.png");
  speech2=loadImage("Bubble2.png");
  laser=loadImage("Bullet.png");
  mark=loadImage("Scratch.png");
  Laser=new Weapon(x6, 0, y6, 20, "Bullet.png");
  over=loadImage("Gameover.jpg");
  vict=loadImage("Victory.jpg");
  file = new SoundFile(this, "Wolverine.mp3");
  file.play();
  file.amp(0.5);
}

void draw()
{

  Collision();
  Input();
  Laser.Render();
  background(255);
  image(vipes, x2, y2, w2, h2);
  image(claw, x, y, w, h);
  if (dist(x, y, x2, y2)<(300))
  {
    image(vict, 0, 0, width, height);
  }
  if (dist(x, y, x6, y6)<(50))
  {
    image(over, 0, 0, width, height);
  }
  if (speech1isAlive == true)
  {
    image(speech1, x3, y3);
  }

  if (speech2isAlive == true)
  {
    image(speech2, x4, y4);
  }

  if (millis()> 3500)
  {
    speech1isAlive = false;
  }

  if (millis()> 3500)
  {
    speech2isAlive = false;
  }
  if (markisAlive==true)
  { 
    image(mark, x5, y5);
    x5-=18;
  }
  if (laserisAlive==true)
  {
    image(laser, x6, y6);
    x6+=18;
  }
}
void Collision()
{
  if (x>2200)
  {
    x= -1000;
  }
  if (y>2200)
  {
    y= 350;
  }

  if (x2>2200)
  {
    x2= -1000;
  }
  if (y2>2200)
  {
    y2= 320;
  }
  //if (mark.CheckCollision(x5, y5, h, w))
  //{

  //  markisAlive=false;
  //}
}


void Input()
{
  if (keyPressed)
  {
    if (key ==' ')
    {
      laserisAlive= true;
      x6 = x2 + 250;
      y6=y2-5;
    }

    if (key =='\n')
    {
      markisAlive= true;
      x= 10;
      y5=y-2;
    }
    if (key =='w')
    {
      y = y -20;
    }

    if (key =='a')
    {
      x =x-20;
    }

    if (key =='s')
    {
      y = y +20;
    }

    if (key =='d')
    {
      x= x+20;
    }
    if (keyCode == UP)
    {
      y2 = y2 -20;
    }

    if (keyCode == DOWN)
    {
      y2 = y2 +20;
    }


    if (keyCode == LEFT)
    {
      x2 =x2-20;
    }
    if (keyCode == RIGHT)
    {
      x2= x2+20;
    }
  }
}
void keyReleased()
{
  if (key == '\n')
  {
    x = 1400;
  }
}