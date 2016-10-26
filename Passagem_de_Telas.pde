Map map;
Menu menu;
Party party;

int PAGE =1;

void setup() {
  size(1000, 563); //Dimensões proporcionais às de smartphones em geral
  imageMode(CENTER);
  map = new Map();
  menu = new Menu();
  party = new Party();
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
  }
}