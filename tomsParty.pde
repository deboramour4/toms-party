import beads.*;

Map map; //3
Menu menu; //1
Party party; //2
Level1Part1 phase1; //4
Level1 level1; //5
Level2 level2; //6
PImage cursor;

int PAGE =1;

boolean click = false;

void setup() {
  size(1000, 563);   //Dimensões proporcionais às de smartphones em geral
  imageMode(CENTER);
  cursor = loadImage("cursor.png");
  map = new Map();
  menu = new Menu();
  party = new Party();
  phase1 = new Level1Part1();
  level1 = new Level1();
  level2 = new Level2();
  fill(0);

}

void draw() {
  cursor(cursor,0,0);
  
  
  switch(PAGE) {
  case 1:
    menu.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20,20);
    menu.events();
    break;

  case 3:
    map.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20,20);
    map.events();
    break;

  case 2:
    party.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20,20);
    party.events();
    break;
    
  case 4:
    phase1.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20,20);
    phase1.events();
    break;

  case 5:
    level1.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20,20);
    level1.events();
    break;
    
  case 6:
    level2.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20,20);
    level2.events();
    break;
  }
}