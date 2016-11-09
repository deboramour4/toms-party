Map map; //2
Menu menu; //1
Party party; //3
Level1 level1; //4

int PAGE =1;

void setup() {
  size(1000, 563); //Dimensões proporcionais às de smartphones em geral
  imageMode(CENTER);
  map = new Map();
  menu = new Menu();
  party = new Party();
  level1 = new Level1();
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
    level1.show();
    level1.events();
    break;
  }
}