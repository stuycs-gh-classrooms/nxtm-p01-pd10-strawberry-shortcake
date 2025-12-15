class Alien {
  PVector position; // top left corner of the alien hitbox.
  int moveSpeed; // how many pixels the alien moves every time move is called.
  int alienHeight; // height of the alien hitbox
  int alienWidth; // width of the alien hitbox
  boolean alive; // is the alien alive?
  boolean chocolateCovered; //is the alien covered in chocolate? (means it has to be hit 2 times in order to die) 
  int aIFrames; //the amount of invincibility frames an alien gets
  int aITimer; //the amount of invincibility left on an alien.
  
  Alien(PVector p, int h, int w) {
    this.moveSpeed = 2;
    this.position = new PVector(p.x,p.y);
    this.alienHeight = h;
    this.alienWidth = w;
    aIFrames = 10;
    aITimer = 0;
    alive = true;
    int rand = int(random(0,10));
    if (rand == 1) {
      chocolateCovered = true;
    }
  }
  
  void update() {
        if (aITimer > 0) {
            aITimer--; 
            if (aITimer == 0) {
              chocolateCovered = false;
            }
        }
    
          
    }

  boolean alienHit (int x, int y, int w, int h) { //checks if the alien is colliding with anything.
    return position.x < x + w && position.x + alienWidth > x && position.y < y + h && position.y + alienHeight > y;
  }
  
  void display() {
  if(alive) {
    if (chocolateCovered == false) {
    drawStrawberry(int(position.x),int(position.y), alienWidth, alienHeight);
    }
    else {
      drawChocolateStrawberry(int(position.x), int(position.y), alienWidth, alienHeight);
    }  
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
void drawStrawberry(int x, int y,int w, int h) {
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

void drawChocolateStrawberry(float x, float y, float w, float h) {
  noStroke();

  // red part
  fill(220, 20, 60); 
  ellipse(x + w/2, y + h/2 + 2, w, h);
  // brown part
  fill(80, 40, 10); 
  arc(x + w/2, y + h/2 + 2, w, h, 0, PI, OPEN); 
  //seeds
  fill(255, 220, 0); 
  ellipse(x + 8, y + 15, 2, 2);
  ellipse(x + 22, y + 15, 2, 2);
  ellipse(x + 15, y + 19, 2, 2);
  //stem
  fill(34, 139, 34); 
  rect(x + w/2 - 1, y - 5, 4, 10);   
  // Leaves
  triangle(x + 5, y + 6, x + 15, y + 6, x + 10, y - 2);
  triangle(x + 15, y + 6, x + 25, y + 6, x + 20, y - 2);
  triangle(x + 9, y + 8, x + 15, y + 3, x + 21, y + 8);
}
}
