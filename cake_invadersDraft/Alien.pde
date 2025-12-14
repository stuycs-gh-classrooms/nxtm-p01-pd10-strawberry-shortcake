class Alien {
  PVector position; // top left corner of the alien hitbox.
  int moveSpeed; // how many pixels the alien moves every time move is called.
  int alienHeight; // height of the alien hitbox
  int alienWidth; // width of the alien hitbox
  boolean alive; // is the alien alive?
  
  
  Alien(PVector p, int h, int w) {
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
    drawStrawberry(int(position.x),int(position.y));    
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
void drawStrawberry(int x, int y) {
int w = alienWidth;
int h = alienHeight;
//red stuff
  fill(200, 0, 0);
  ellipse(x + w/2, y + h/2 + 2, w, h); 

//stem and leaves
  fill(0, 150, 0); 
  noStroke();
  rect(x + w/2 - 1, y - 5, 4, 10); 
  triangle(x + 5, y + 6, x + 15, y + 6, x + 10, y - 2);
  triangle(x + 15, y + 6, x + 25, y + 6, x + 20, y - 2);
  triangle(x + 9, y + 8, x + 15, y + 3, x + 21, y + 8);
 
//seeds
  fill(255, 200, 0); 
  ellipse(x + 8, y + 15, 2, 2);
  ellipse(x + 22, y + 15, 2, 2);
  ellipse(x + 15, y + 19, 2, 2);
  ellipse(x + 5, y + 21, 2, 2);
  ellipse(x + 25, y + 21, 2, 2);
  ellipse(x + 10, y + 25, 2, 2);
  ellipse(x + 20, y + 25, 2, 2);
  ellipse(x + 15, y + 28, 2, 2);
}
}
