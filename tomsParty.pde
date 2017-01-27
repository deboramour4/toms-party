import beads.*;

Menu menu; //1
Party party; //2
Map map; //3
Credits credits; //4
Level1 level1; //5
Level2 level2; //6
Level3 level3; //7
PImage mouse, hand;

int PAGE =1;

boolean click = false;

void setup() {
  size(1000, 563);   //Dimensões proporcionais às de smartphones em geral
  imageMode(CENTER);
  mouse = loadImage("cursor.png");
  hand = loadImage("hand.png");
  map = new Map();
  menu = new Menu();
  party = new Party();
  level1 = new Level1();
  level2 = new Level2();
  level3 = new Level3();
  credits = new Credits();
  fill(0);
}

void draw() {
  cursor(mouse, 0, 0);

  switch(PAGE) {
  case 1:
    menu.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    menu.events();
    break;

  case 3:
    map.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    map.events();
    break;

  case 2:
    party.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    party.events();
    break;

  case 4:
    credits.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    credits.events();
    break;

  case 5:
    level1.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    level1.events();
    break;

  case 6:
    level2.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    level2.events();
    break;

  case 7:
    level3.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    level3.events();
    break;
  }
}