class Bullet {
  PVector head; //stores the x and y coords of the top left corner of the bullet.
  int bulletType; // 0 = alien bullet, 1 = playerbullet
  int bulletSpeed; // how many pixels the the bullet moves per tick.
  int bulletHeight; // how long the bullet is.
  int bulletWidth; // how wide the bullet is.
  boolean alive; // set to false once the bullet hits something or goes offscreen.
  color bColor; // color of the bullet
  
  Bullet(PVector h, int type) {
    this.head = new PVector(h.x,h.y);
    this.bulletType = type;
    bulletSpeed = 10;
    alive = true;
    bulletHeight = 10;
    bulletWidth = 4;
    bColor = randomColor();
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
  
  int rand () {
    return int(random(0,255));
  }
  
  color randomColor () {
    return (color(rand(),rand(),rand()));    
  }
  
  void display () {
    if (bulletType == 1) {
    fill(bColor);
    noStroke();
    rect(head.x,head.y, bulletWidth, bulletHeight);    
    }
    if (bulletType == 0) {
      fill(255);
      rect(head.x,head.y,bulletWidth,bulletHeight);
    }
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
