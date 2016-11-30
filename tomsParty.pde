import beads.*;

Map map;
Menu menu;
Party party;
Phase1Page1 phase1;

int PAGE =1;

void setup() {
  size(1000, 563);   //Dimensões proporcionais às de smartphones em geral
  imageMode(CENTER);
  map = new Map();
  menu = new Menu();
  party = new Party();
  phase1 = new Phase1Page1();
}

void draw() {
  switch(PAGE) {
  case 1:
    menu.show();
    menu.events();
    break;

  case 2:
    map.show();
    map.events();
    break;
    
  case 3:
    party.show();
    party.events();
    break;
    
  case 4:
    phase1.show();
    phase1.events();
    break;
  }
}