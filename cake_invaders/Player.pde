class Player {
  PVector position; // top left corner of the player hitbox.
  int moveSpeed; // how many pixels the player moves every time move is called.
  int playerHeight; // height of the player hitbox
  int playerWidth; // width of the player hitbox
  PVector head; // the top center of the player hitbox where bullets generate.
  
  Player(PVector h) {
    this.moveSpeed = 2;
    this.position = new PVector(h.x,h.y);
    playerHeight = 50;
    playerWidth = 50;
  }
  
  boolean collisionCheck(Bullet b, Barrier s) {
   if 
  }
  
  boolean PlayerHit (int x, int y, int w, int h) { //checks if the player is colliding with anything.
    return position.x < x + w &&
           position.x + playerWidth > x &&
           position.y < y + h &&
           position.y + playerHeight > y;
  }
  
  void display() {
    fill(0);
    rect(position.x,position.y,playerWidth,playerHeight);    
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
