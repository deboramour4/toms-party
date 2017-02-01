class Moves {
  float x = 0, y = 0;      
  float speed, i;          
  boolean moving = false;
  int animManager = 0;
  Animation[] animations;

  Moves() {
  }

  //The costructor recieves the object position and the number of spaces in the array of animations 
  Moves(int nAnimations ) {
    animations = new Animation[nAnimations];
  }

  void show(int animManager, float x2, float y2, float duration, boolean onLoop) {
    x = x2;
    y = y2;
    if (onLoop) {
      animations[animManager].display(x, y, duration);
    } else {
      animations[animManager].display2(x, y, duration);
    }
  }

  void moveRight(float x2, float speed) {
    if (x < x2-speed) {
      moving = true;
      x += speed;
      animManager = 4;
    } else if (x > x2 +speed) {
      x -= speed;
    } else {
      moving = false;
      animManager = 0;
    }
    //show(animManager, x, y,3);
  }

  void moveUpDown(float y2, float speed) {
    if (y < y2-speed) {
      moving = true;
      y += speed;
      animManager = 4;
    } else if (y > y2 +speed) {
      y -= speed;
    } else {
      moving = false;
      animManager = 0;
    }
    //show(animManager, x, y,3);
  }

  //Fuction to move the player. Recieves the destination and speed
  void move(float x2, float y2, float speed) {
    if (x <= x2) {
      x += speed;
    }
  }
}