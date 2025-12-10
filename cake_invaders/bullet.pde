class Bullet {
  PVector head; //stores the x and y coords of the top left corner of the bullet.
  int bulletType; // 0 = alien bullet, 1 = playerbullet
  int bulletSpeed; // how many pixels the the bullet moves per tick.
  int bulletHeight; // how long the bullet is.
  int bulletWidth; // how wide the bullet is.
  boolean alive; // set to false once the bullet hits something or goes offscreen.
  
  Bullet(PVector h, int type) {
    this.head = new PVector(h.x,h.y);
    this.bulletType = type;
    bulletSpeed = 10;
    alive = true;
    bulletHeight = 5;
    bulletWidth = 2;
  }
  
  boolean collisionCheck(Player p, Alien a, Barrier b) {
    if (bulletType == 0) { // alienBullet collision detection
      if (bulletHits(p.x,p.y,p.w,p.h) == true) {
        return true;
      }
      if (bulletHits(b.x,b.y,b.w,b.h) == true) {
        return true;
      }
      else {
        return false;
      }
    }
    else if (bulletType == 1) { // playerBullet collision detection
      if (bulletHits(a.x,a.y,a.w,a.h) == true) {
        return true;
      }
      if (bulletHits(b.x,b.y,b.w,b.h) == true) {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
  
  
  
  boolean bulletHits (int x, int y, int w, int h) { // checks if the bullet hitbox is inside of the hitbox of another class. Inputs are the hitbox upper-left corner coords & dimensions of the other class.
    return head.x < x + w && // checks if the head
           head.x + bulletWidth > x &&
           head.y < y + h &&
           head.y + bulletHeight > y;
  }
  
  color randomColor () {
    int rand = int(random(0,255));
    return (color(rand,rand,rand));    
  }
  
  void display () {
    fill(randomColor());
    rect(head.x,head.y, bulletWidth, bulletHeight);    
  }
  
  void move() { //move y-speed number of pixels up or down depending on whether its an alien or a player bullet.
  if (bulletType == 1) { // playerBullet
    head.y = head.y - bulletSpeed;
  }
  if (bulletType == 0) { // alienBullet
    head.y = head.y + bulletSpeed;
  }
  }
  
}
