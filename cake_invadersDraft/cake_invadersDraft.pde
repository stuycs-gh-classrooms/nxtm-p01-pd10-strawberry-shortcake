Player tank;
Barrier shield;
Alien[][] alienGrid;
Bullet[] playerBullets;
Bullet[] alienBullets;

int score;
int livesNum;
int roundNum;
boolean started; //tracks if the game has started or not.
  
int alienDirection;
int alienHeight;
int alienWidth;
int aRows;
int aCols;
int alienMoveInterval; // time between each alien movement
int alienMoveTimer; // countdown towards alien moving.
int padding;
int playerMoveSpeed;
int invincibilityFrames;
int invincibilityTimer;
int roundOverTimer;
int roundOverFrames;
  
int cooldownFrames; //bullet cooldown in seconds
int cooldownTimer; //tracks how long till the next shot
int alienShootFrames;
int alienShootTimer;
  
boolean isDead;
boolean roundOver;
boolean gameOver;
void setup() {
  size(500,500);
  frameRate(60);
  genStartBackground();
  started = false;
  }
  
void draw() {
  if (started == true && gameOver == false) {
   if (roundOverTimer > 0) {
     roundOverTimer--;     
  }
  else {
    roundOver = false;
    isDead = false;
  }
  }
  if (started == true && gameOver == false && roundOver == false && isDead == false) {
        genGameBackground();
        tank.display(isDead);
        if (invincibilityTimer > 0) {
          invincibilityTimer--;
        }
        if (cooldownTimer > 0) {
          cooldownTimer--;
        }
        if (alienShootTimer > 0) {
          alienShootTimer--;
        }
        makeAlienBullet();
      if (!(playerBullets == null)) {  //display and move playerBullets;
        for (int i = 0; i < playerBullets.length; i++){
        if (!(playerBullets[i] == null) && playerBullets[i].alive) {
          playerBullets[i].move();
          playerBullets[i].display();
       
        }
        }
      }
        if (!(alienBullets == null)) {  //display and move alienBullets;
        for (int i = 0; i < alienBullets.length; i++){
        if (!(alienBullets[i] == null) && alienBullets[i].alive) {
          alienBullets[i].move();
          alienBullets[i].display();       
        }       
        }
      }
      
      bulletDespawner();
      
      if (!(alienGrid == null)) { //display and move aliens
        alienMoveTimer++;
        if (alienMoveTimer >= alienMoveInterval) {
          moveAlienGrid();
          alienMoveTimer = 0;
    }        
        for (int r = 0; r < alienGrid.length; r++) {
          for (int c = 0; c < alienGrid[0].length; c++) {
            if (alienGrid[r][c] != null && alienGrid[r][c].alive) {
               alienGrid[r][c].display();
               
      }
    }
  }
}
         
checkCollisions();
roundWon();
roundLost();
      }
    } 
    
void keyPressed() {
  if (started == true) {
     if ((key == ' ' || keyCode == ENTER) && cooldownTimer == 0) {
       makePlayerBullet();
       cooldownTimer = cooldownFrames;
     }
    if (keyCode == LEFT) {
      tank.move(0);
      if (tank.position.x < 0) {
        tank.position.x = 0;
      }
      
    }
    if (keyCode == RIGHT) {
      tank.move(1);
      if (tank.position.x > width - tank.playerWidth) {
        tank.position.x = width - tank.playerWidth;
      }
    }
  }
    if(key == 's' && started == false) {
      started = true;
      startGame();
    }
    if(key == 'g' && started == true) {
      godMode();
      
    
    }
  }
  
void gameRestart() {
    //calls startGame() 
  }
  
  void startGame() {
    score = 0;
    roundNum = 1;
    livesNum = 3;
    cooldownTimer = 0;
    cooldownFrames = 15;
   
   //set boolean roundOver and gameOver to false
    isDead = false;
    roundOver = false;
    gameOver = false;
    
    playerBullets = new Bullet[100];
    alienBullets = new Bullet[5];
  
    alienHeight = 30;
    alienWidth = 30;
    aRows = 4;
    aCols = 10;
    alienGrid = new Alien[aRows][aCols];
    alienDirection = 1;
    alienMoveInterval = 60;
    alienMoveTimer = 0;
    alienShootTimer = 0;
    alienShootFrames = 100;
    invincibilityTimer = 0;
    invincibilityFrames = 50;
    roundOverTimer = 0;
    roundOverFrames = 100;
  
    genGameBackground();
    makePlayer();
    padding = 50;
    makeAlienGrid(alienGrid);
  }
  
void makePlayer() {
    for (int i = 0; i < 2; i++) {
    tank = new Player(new PVector(0,0));
    }
  }
  
void makePlayerBullet() {
    int index = findAvailableIndex(playerBullets);
    if (index != -1) {
      playerBullets[index] = new Bullet(new PVector(tank.position.x + (tank.playerWidth / 2), tank.position.y), 1);
    }
    }
    
void makeAlienBullet() { //%chance for an alien to spawn a bullet.
int rand = int(random(1,alienGrid.length * (2 * alienGrid.length) + 10));
if (rand == 1) {
     int index = findAvailableIndex(alienBullets);
    if (index != -1) {
      int r = int(random(0,alienGrid.length));
      int c = int(random(0,alienGrid[0].length));
      if (!(alienGrid[r][c] == null) && alienGrid[r][c].alive) {
      alienBullets[index] = new Bullet(new PVector (alienGrid[r][c].position.x + (alienGrid[r][c].alienWidth / 2), alienGrid[r][c].position.y + alienGrid[r][c].alienHeight), 0);
    }
    }
    }
}

    
  
void makeAlienGrid(Alien[][] g) {
  float startX = padding;     
  float startY = 30 + (30 * (roundNum / 2));

  for (int r = 0; r < g.length; r++) {
    for (int c = 0; c < g[0].length; c++) {

      float x = startX + c * (alienWidth + 5); 
      float y = startY + r * (alienHeight + 10);

      g[r][c] = new Alien(new PVector(x, y), alienWidth, alienHeight);    
    }
  }
  }
  
void genGameBackground() {
    chocolateCake();
    fill(0);
    textSize(20);
    text("score: " + score, 0,20);
    text("lives: " + livesNum, width - 100, 20);
  }
  
void genStartBackground() {
    textSize(40);
    rect(0,450,width,height);
    chocolateCake();
    fill(0);
    text("Protect your cake from the...", 20,80);
    textSize(60);
    text("CAKE INVADERS", 50,200);
    text("press 's' to start!",50,300);  
  }
  
void genLostBackground() {
    fill(255,0,0);
    strawbShortcake();
    textSize(30);
    text("strawberries have taken over!",width / 7,120);
    text("your score: " + score, 160, 200);
    text("press 's' to try and reclaim your cake!", 20, 270);

  }
  
int findAvailableIndex(Bullet[] b) { // finds the first available index for bullet.
  for (int i = 0; i < b.length; i++) { // checks every index in bs.
    if (b[i] == null) { // if there is nothing, then return the index number
      return i;
    }
  }
  return -1; // if there is not something return -1
}

int findAvailableIndex(Alien[][] g) { // finds the first available index for alien.
  for (int i = 0; i < g.length; i++) { // checks every index in bs.
    if (g[i] == null) { // if there is nothing, then return the index number
      return i;
    }
  }
  return -1; // if there is not something return -1
}

void bulletDespawner() { //despawns the bullet once it goes offscreen 
  for (int i = 0; i < playerBullets.length; i++) {
  if(!(playerBullets[i] == null)) {
  if (playerBullets[i].head.y < 0 || playerBullets[i].alive == false) {
    playerBullets[i] = null;
    println(i);
  }
  }
  } 
  for (int i = 0; i < alienBullets.length; i++) {
    if(!(alienBullets[i] == null)) {
    if (alienBullets[i].head.y > height || alienBullets[i].alive == false) {
      alienBullets[i] = null;
      println("alien" + i);
    }
  }
    
}
}
  

void moveAlienGrid() {
  if (alienGrid == null) {
    return;
  }

  float leftMost = width;
  float rightMost = 0;
  
  for (int r = 0; r < alienGrid.length; r++) {
    for (int c = 0; c < alienGrid[0].length; c++) {
      Alien a = alienGrid[r][c];
      if (a != null && a.alive) {
        if (a.position.x < leftMost) leftMost = a.position.x;
        if (a.position.x + a.alienWidth > rightMost) rightMost = a.position.x + a.alienWidth;
      }
    }
  }

  
  // Check if the grid hits screen edges
  boolean hitEdge = false;
  if (rightMost >= width - padding && alienDirection == 1) hitEdge = true;
  if (leftMost <= padding && alienDirection == -1) hitEdge = true;
  
  // Move aliens
  for (int r = 0; r < alienGrid.length; r++) {
    for (int c = 0; c < alienGrid[0].length; c++) {
      if (!(alienGrid[r][c] == null) && alienGrid[r][c].alive) {
        if (hitEdge) {
          alienGrid[r][c].position.y = alienGrid[r][c].position.y + alienHeight; // drop down
        } else {
          alienGrid[r][c].position.x += alienDirection * alienWidth; // move left/right
        }
      }
    }
  } 
    
  // If hit edge, reverse direction
  if (hitEdge) alienDirection *= -1;
}

void checkCollisions() {
  // player bullets v aliens
  for (int i = 0; i < playerBullets.length; i++) { // checks every index in the array
    if (!(playerBullets[i] == null) && playerBullets[i].alive) { // if the playerBullet is alive and not null
      for (int r = 0; r < alienGrid.length; r++) { // rows
        for (int c = 0; c < alienGrid[0].length; c++) { // columns
          if (alienGrid[r][c] != null && alienGrid[r][c].alive) { // checks if the alien in that index is alive and not null
            if (alienGrid[r][c].alienHit(int(playerBullets[i].head.x), int(playerBullets[i].head.y), playerBullets[i].bulletWidth, playerBullets[i].bulletHeight)) { // checks if it is hitting a playerBullet
              alienGrid[r][c].alive = false;  // kill alien
              playerBullets[i].alive = false; // kill bullet
              score += 10; // score goes up by 10! yay!
          }
        }
      }
    }
  }
}
  
//alien bullets v player

  for (int i = 0; i < alienBullets.length; i++) {
    if (!(alienBullets[i] == null) && alienBullets[i].alive) {
      if (tank.playerHit(int(alienBullets[i].head.x), int(alienBullets[i].head.y), alienBullets[i].bulletWidth, alienBullets[i].bulletHeight) && invincibilityTimer == 0) {
        alienBullets[i].alive = false; // destroy bullet
        livesNum--; // decrease player life
        isDead = true;
        invincibilityTimer = invincibilityFrames;
        if (livesNum <= 0) {
          gameOver = true;
          gameOver();
        }
      }
    }
  }


/* //barrier part
  for (int i = 0; i < playerBullets.length; i++) {
    if (!(playerBullets == null) && playerBullets[i].alive) {
      if (!(shield = null)) {
        if (shield.barrierHit(int(playerBullets[i].head.x), int(playerBullets.head.y), playerBullets.bulletWidth, playerBullets.bulletHeight)) {
          playerBullets[i].alive = false;
          playerBullets[i] = null;
        }
      }
    }
  }

  for (int i = 0; i < alienBullets.length; i++) {
    if (!(alienBullets[i] == null) && alienBullets[i].alive) {
      if (!(shield = null)) {
        if (shield.barrierHit(int(alienBullets[i].head.x), int(alienBullets[i].head.y), alienBullets[i].bulletWidth, alienBullets[i].bulletHeight)) {
          alienBullets[i].alive = false;
          alienBullets[i] = null;
        }
      }
    }
  }
*/

//aliens vs. ground. 
      for (int r = 0; r < alienGrid.length; r++) { // rows
        for (int c = 0; c < alienGrid[0].length; c++) { // columns
          if (alienGrid[r][c] != null && alienGrid[r][c].alive) { // checks if the alien in that index is alive and not null
          if (alienGrid[r][c].position.y + alienGrid[r][c].alienHeight >= 450) {
            gameOver();
          }
        }
      }
    }
    
  }



void gameOver() {
  started = false;
  genLostBackground();
}

void roundWon() {
  for (int r = 0; r < alienGrid.length; r++) {
    for (int c = 0; c < alienGrid[0].length; c++) {
      if (alienGrid[r][c].alive && !(alienGrid[r][c] == null)) {
        return; // at least one alien still alive
      }
    }
  }
  roundOver = true;
  roundNum++;
  livesNum++;
  textSize(80);
  fill(0);
  text("Round " + roundNum, width / 5, 240);
  roundOverTimer = roundOverFrames;
  makeAlienGrid(alienGrid);
  tank.position.x = int((width / 2) - (tank.playerWidth / 2));
  tank.position.y = 450 - tank.playerHeight;
}

void roundLost() {
  if (isDead == true && gameOver == false) {
    roundOverTimer = roundOverFrames;
    genGameBackground();
    for (int r = 0; r < alienGrid.length; r++) {
          for (int c = 0; c < alienGrid[0].length; c++) {
            if (alienGrid[r][c] != null && alienGrid[r][c].alive) {
               alienGrid[r][c].display();
            }
          }
    }
    tank.display(isDead);
    tank.position.x = int((width / 2) - (tank.playerWidth / 2));
    tank.position.y = 450 - tank.playerHeight;
  }
  else return;
}
    

void godMode() {
  livesNum = 1000;
  cooldownFrames = 1;
}

void strawbShortcake() {
  background(255, 228, 225); 
  
  int cakeB = 450;
  int layerHeight = 50;
  
  // bottom layer
  fill(255, 250, 250);
  noStroke();
  rect(0, cakeB, width, layerHeight);
  
  // middle layer
  fill(255, 182, 193); 
  rect(0, cakeB - layerHeight, width, layerHeight);
  
  // top layer
  fill(255, 250, 250);
  rect(0, cakeB - 2*layerHeight, width, layerHeight);
  
  // frosting
  fill(255); 
  rect(0, cakeB - 120, width, 20);     
 //strawberries
  fill(255, 0, 50); 
  for (int i = 50; i <= width - 50; i += 60) {
    ellipse(i, cakeB - 2 * layerHeight - 15, 12, 12);
    //leaves
    fill(0, 150, 0); 
    triangle(i-3, cakeB - 2 * layerHeight - 21, 
             i, cakeB - 2 * layerHeight - 27, 
             i+3, cakeB - 2*layerHeight - 21);
    fill(255, 0, 50); 
  }
}

void chocolateCake() {
  background(255, 228, 225); 
  
  int cakeB = 570;
  int layerHeight = 60;
//bottom layer
  fill(139, 69, 19); 
  noStroke();
  rect(0, cakeB, width, layerHeight);
//middle layer
  fill(160, 82, 45);
  rect(0, cakeB - layerHeight, width, layerHeight);
//bottom layer
  fill(139, 69, 19);
  rect(0, cakeB - 2*layerHeight, width, layerHeight);
  
  fill(205, 133, 63);
  //chocolate frosting
  rect(0, 440, width, 20);
 
  
  //sprinkles!!
  for (int y = (int)(cakeB - 2*layerHeight); y <= (int)(cakeB + layerHeight); y += 15) {
    for (int x = 20; x <= width - 20; x += 20) {
      if ((x/20 + y/15) % 5 == 0) fill(255, 0, 0);     
      else if ((x/20 + y/15) % 5 == 1) { 
      fill(0, 255, 0);
      }
      else if ((x/20 + y/15) % 5 == 2) {
        fill(0, 0, 255);  
      }
      else if ((x/20 + y/15) % 5 == 3) {
        fill(255, 255, 0);
      }
      else {
        fill(255, 105, 180); 
      }
      ellipse(x, y, 5, 5 / 2);
    }
  }
  
}
  
