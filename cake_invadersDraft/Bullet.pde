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
    bulletHeight = 10;
    bulletWidth = 4;

  }

  boolean hitsPlayer(Player p) {
  return bulletHits(int(p.position.x), int(p.position.y), p.playerWidth, p.playerHeight);
  }

  boolean hitsAlien(Alien a) {
  return bulletHits(int(a.position.x), int(a.position.y), a.alienWidth, a.alienHeight);
  }
/*
  boolean hitsBarrier(Barrier b) {
  return bulletHits(b.x, b.y, b.w, b.h);
  }
  */
  boolean bulletHits (int x, int y, int w, int h) { // checks if the bullet hitbox is inside of the hitbox of another class. Inputs are the hitbox upper-left corner coords & dimensions of the other class.
    return head.x < x + w && head.x + bulletWidth > x && head.y < y + h && head.y + bulletHeight > y; 
  }
  
  void display () {
    if (bulletType == 1) {
    noStroke();  
    fill(255, 140, 0); 
    ellipse(head.x + bulletWidth/2, head.y - 8, 10, 15);
    fill(255, 215, 0); 
    ellipse(head.x + bulletWidth/2, head.y - 8, 6, 10);
    }
    if (bulletType == 0) {
      fill(255, 200, 0);
      noStroke();
      ellipse(head.x, head.y, 10, 12);
    }
  }
  
  void move() { //move y-speed number of pixels up or down depending on whether its an alien or a player bullet.
  if (bulletType == 1) { // playerBullet
    head.y = head.y - bulletSpeed;
  }
  if (bulletType == 0) { // alienBullet
    head.y = head.y + bulletSpeed / 4;

  }
  }
  
}
