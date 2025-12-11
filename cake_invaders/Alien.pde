class Alien {
  PVector position; // top left corner of the alien hitbox.
  int moveSpeed; // how many pixels the alien moves every time move is called.
  int alienHeight; // height of the player hitbox
  int alienWidth; // width of the player hitbox
  PVector head; // the top center of the player hitbox where bullets generate.
  
  Alien(PVector h) {
    this.moveSpeed = 2;
    this.position = new PVector(h.x,h.y);
    alienHeight = 50;
    alienWidth = 50;
  }
/*  
  boolean collisionCheck(Bullet b, Barrier s) {
    if (playerHit(s.x,s.y,s.w,s.h) == true) {
      return true;
    }
    if (playerHit(b.head.x,b.head.y,b.bulletWidth,b.bulletHeight) == true) {
      return true;
    }
    else {
      return false;
    }
  }
 */ 
  boolean playerHit (int x, int y, int w, int h) { //checks if the alien is colliding with anything.
    return position.x < x + w &&
           position.x + alienWidth > x &&
           position.y < y + h &&
           position.y + alienHeight > y;
  }
  
  void display() {
    fill(0);
    rect(position.x,position.y,alienWidth,alienHeight);    
  }
  
  void move(int direction) { 
    if (direction == 0) { //left
      position.x = position.x - moveSpeed;    
  }
    if (direction == 1) {
      position.x = position.x + moveSpeed;
    }
  }
 
    
}
