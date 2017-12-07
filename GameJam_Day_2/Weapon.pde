class Weapon
{
  // DATA of the 'weapon' class
  int damage;
  PImage img;
  int type;
  float speedX;
  float x;
  float y;
  boolean isAlive;
 
  void Render()
  {
    if (isAlive)
    {
      image(img, x, y);

      x=x+ speedX;
    }

    if (x>width+100)
    {
      x= -0;
    }
  }



  //Overloaded Constructor
  Weapon(int damage1, float x1, float y1, float speedX1, String _filename)
  {
    damage=damage1;
    x=x1;
    y=y1;
    type=0;
    speedX=speedX1;
    isAlive= false;
    img=loadImage(_filename);
  }



  //Default Constructor
  Weapon()
  {
    damage=10;
    x=400;
    y=400;
    type=0;
    speedX=200;
    isAlive= false;
  }



  boolean CheckCollision(float _X, float _Y, float _W, float _H)
  {
    boolean result = false;
    if (_X < x + img.width &&
      _X + _W > x &&
      _Y < y + img.height &&
      _H + _Y > y) 
    {
      // collision detected!
      result= true;
    }

    //rect1: _X _Y _W _H
    //rect2: x, y, img.width, img.height




    return result;
  }
}