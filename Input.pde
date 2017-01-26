//this class will recieve all kind of users input, and handle it.
//the intention is make the it easier to use in the principal classes.

class Input {
  private float x; //position x of the element
  private float y; //position y of the element
  private float w; //width the element
  private float h; //height of the element

  private float mouseDistance; // for the clickRadial method

  private float newX; // for the drag method
  private float newY; // for the drag method
  private boolean draggedArea = false; //for the drag method
  
  private boolean pressed = false, clicked = false;


  //this function returns true if the mouse was clicked in a determinated local of the screen
  //  the paramethers are: a image button, x and y of the image button
  boolean click(PImage image, float x, float y) {
    if (mousePressed && mouseX>x-(image.width/2) && mouseX<x+(image.width/2) && mouseY>y-(image.height/2) && mouseY<y+(image.height/2)) {
      return true;
    } else {
      return false;
    }
  }

  //this function returns true if the mouse was clicked inside of a circle and false if not.
  // the paramethers are: a image button, x and y of the image button
  boolean clickRadial(PImage image, float x, float y) {
    mouseDistance = sqrt(((mouseX-x)*(mouseX-x))+((mouseY-y)*(mouseY-y)));
    if (mousePressed) {
      if (mouseDistance < image.width/2)
        return true;
      else
        return false;
    } else {
      return false;
    }
  }

  // This function check if the button was clicked and returns a boolean
  boolean clickButton(PImage normalI, PImage pressedI, float x, float y)
  {
    //draw the button
    clicked = false;
    if (inside(normalI, x, y)) {
      if (pressed) {
        image(pressedI, x, y);
      } else
      {
        image(normalI, x, y);
      }
    } 
    else {
      image(normalI, x, y);
    }

    // test the click  
    //Estate machine transitions
    if (!pressed && mousePressed) {    // pressed transition to = true
      pressed = true;
    }
    if (pressed && !mousePressed) {  // pressed transition to = false
      pressed = false;   
      if (inside(normalI, x, y)) {
        clicked= true;
      }
    }
    return clicked;
  }


  //this function returns true if the mouse was inside a determinated local of the screen
  // and false if not.
  boolean inside(PImage image, float x, float y) {
    if (mouseX>x-(image.width/2) && mouseX<x+(image.width/2) && mouseY>y-(image.height/2) && mouseY<y+(image.height/2)) {
      return true;
      // cursor(HAND);
    } else
      return false;
  }

  //this function returns the new X and y of the dragged image
  boolean drag(PImage image, float x, float y ) {
    if (click(image, x, y) && draggedArea == false) {
      draggedArea = true;
    } 
    if (mousePressed && draggedArea) {
      newX = mouseX;
      newY = mouseY;
      image(image, newX, newY);
      return true;
    } else {  
      draggedArea = false;
      return false;
    }
  }

  //GETS E SETS
  float getNewX() {
    return newX;
  }
  float getNewY() {
    return newY;
  }


  //ROTATE ELEMENTS
  void rotateIt(PImage image, float x, float y, float angle) {
    translate(0, 0);
    pushMatrix();
    translate(x, y);
    rotate(angle);
    image(image, 0, 0);
    popMatrix();
  }
}