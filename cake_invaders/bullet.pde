class Bullet {
  PVector head;
  int bulletType; // 0 = alien bullet, 1 = playerbullet
  int bulletSpeed; // how many pixels the the bullet moves per frame.
  int bulletHeight; // how long the bullet is.
  
  Bullet(PVector h, int type) {
    this.head = new PVector(h.x,h.y);
    this.bulletType = type;
    bulletSpeed = 10;
    if (bulletType == 0) {
      bulletSpeed = -bulletSpeed;
    }
  }
  
  boolean collisionCheck(int type, Player p, Alien a, Barrier b) {
    return (this.head.y.dist(other.center.y)) <= (this.bulletHeight + other.center.y);
}

  void display () {
    
    
  }
  
  void move() {
    
  }
