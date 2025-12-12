class Alien {
  PVector position; // top left corner of the alien hitbox.
  int moveSpeed; // how many pixels the alien moves every time move is called.
  int alienHeight; // height of the alien hitbox
  int alienWidth; // width of the alien hitbox
  boolean alive; // is the alien alive?
  
  
  Alien(PVector p, int w, int h) {
    this.moveSpeed = 2;
    this.position = new PVector(p.x,p.y);
    this.alienHeight = h;
    this.alienWidth = w;
    alive = true;
  }

  boolean alienHit (int x, int y, int w, int h) { //checks if the alien is colliding with anything.
    return position.x < x + w && position.x + alienWidth > x && position.y < y + h && position.y + alienHeight > y;
  }
  
  void display() {
  if(alive) {
    fill(0);
    rect(position.x,position.y,alienWidth,alienHeight);  
    
  }
  }
  
  void move(int direction) { 
    if (direction == 0) { //left
      position.x = position.x - moveSpeed;    
  }
    if (direction == 1) { // right
      position.x = position.x + moveSpeed;
    }  
    if (direction == 2) { // down
      position.y = position.y + moveSpeed;
    }
}
}
