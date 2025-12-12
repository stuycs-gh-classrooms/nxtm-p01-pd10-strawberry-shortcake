class Player {
  PVector position; // top left corner of the player hitbox.
  int moveSpeed; // how many pixels the player moves every time move is called.
  int playerHeight; // height of the player hitbox
  int playerWidth; // width of the player hitbox
  
  
  Player(PVector h) {
    this.moveSpeed = 10;
    this.position = new PVector(h.x,h.y);
    playerHeight = 50;
    playerWidth = 50;
    position.x = int((width / 2) - (playerWidth / 2));
    position.y = int((450 - playerHeight));
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
  boolean playerHit (int x, int y, int w, int h) { //checks if the player is colliding with anything.
    return position.x < x + w &&
           position.x + playerWidth > x &&
           position.y < y + h &&
           position.y + playerHeight > y;
  }
  
  void display() {
    fill(0);
    rect(position.x,position.y + playerHeight/2,playerWidth,playerHeight / 2);  
    rect(position.x + (playerWidth / 2) - 3, position.y + 5, 6, playerHeight / 2);
  }
  
  void move(int direction) { 
    if (direction == 0) { //left
      position.x = position.x - moveSpeed;    
  }
    if (direction == 1) { //right
      position.x = position.x + moveSpeed;
    }
  }    
}
