Player tank;
Barrier shield;

Alien[][] alienGrid;
Bullet[] playerBullets;
Bullet[] alienBullets;

int score;
int livesNum;
int roundNum;
  
int alienDirection;
int alienHeight;
int alienWidth;
int aRows;
int aCols;
int alienMoveInterval;
int alienMoveTimer;
  
int playerMoveSpeed;
  
int cooldownFrames; //bullet cooldown in seconds
int cooldownTimer; //tracks how long till the next shot
  
boolean isDead;
boolean roundOver;
boolean gameOver;
void setup() {
  size(500,500);
  frameRate(60);
  playerBullets = new Bullet[100];
  alienBullets = new Bullet[100];
  alienHeight = 30;
  alienWidth = 30;
  aRows = 5;
  aCols = 11;
  alienGrid = new Alien[aRows][aCols];
  alienDirection = 1;
  alienMoveInterval = 60;
  alienMoveTimer = 0;
  startGame();
  }
  
void draw() {
    if (gameOver == false) {
      if (roundOver == false) {
        genBackground();
        tank.display();
        if (cooldownTimer > 0) {
          cooldownTimer--;
        }
      if (playerBullets != null) {  //display and move playerBullets;
        for (int i = 0; i < 100; i++){
        if (playerBullets[i] != null && playerBullets[i].alive) {
          playerBullets[i].move();
          playerBullets[i].display();
       
        }
        bulletDespawner();
        }      
      }
      
      if (alienGrid != null) { //display and move aliens
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
      }            
      }
    } 
void keyPressed() {
    if(key == 'r') {
      startGame();
    }
     if ((key == ' ' || keyCode == ENTER) && cooldownTimer == 0) {
       makePlayerBullet();
       cooldownTimer = cooldownFrames;
     }
    if (keyCode == LEFT) {
      tank.move(0);
    }
    if (keyCode == RIGHT) {
      tank.move(1);
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
    cooldownFrames = 10;
   
   //set boolean roundOver and gameOver to false
    isDead = false;
    roundOver = false;
    gameOver = false;
    
    genBackground();
    makePlayer();
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
  
void makeAlienGrid(Alien[][] g) {
  float startX = 0;     
  float startY = 0;

  for (int r = 0; r < g.length; r++) {
    for (int c = 0; c < g[0].length; c++) {

      float x = startX + c * (alienWidth + 5); 
      float y = startY + r * (alienHeight + 1);

      g[r][c] = new Alien(new PVector(x, y), alienWidth, alienHeight);    
    }
  }
  }
  
void genBackground () {
    background(255);
    fill(255,0,0);
    rect(0,450,width,height);    
  }
  
int findAvailableIndex(Bullet[] b) { // finds the first available index.
  for (int i = 0; i < 100; i++) { // checks every index in bs.
    if (b[i] == null) { // if there is nothing, then return the index number
      return i;
    }
  }
  return -1; // if there is something return -1
}

void bulletDespawner() { //despawns the bullet once it goes offscreen 
  if (findAvailableIndex(playerBullets) == -1) {
  for (int i = 0; i < playerBullets.length; i++) {
  if (playerBullets[i].head.y < 0) {
    playerBullets[i] = null;
    println(i);
  }
  }
  }
  if (findAvailableIndex(alienBullets) == -1) {
  for (int i = 0; i < alienBullets.length; i++) {
  if (alienBullets[i].head.y > height) { 
    alienBullets[i] = null;
    println(i);
  }
  }
  }
  
  }

void moveAlienGrid() {
  if (alienGrid == null) {
    return;
  }
  //takes the right and left most points to set the x values of the alien.
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
  if (rightMost >= width && alienDirection == 1) hitEdge = true;
  if (leftMost <= 0 && alienDirection == -1) hitEdge = true;
  
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
              playerBullets[i].alive = false; // destroy bullet
              score += 10; // score goes up by 10! yay!
          }
        }
      }
    }
  }
}
  
//alien bullets v player
/*
  for (int i = 0; i < alienBullets.length; i++) {
    if (!(alienBullets[i] == null) && alienBullets[i].alive) {
      if (tank.playerHit(alienBullets.head.x, alienBullets.head.y, alienBullets.bulletWidth, alienBullets.bulletHeight)) {
        alienBullets[i].alive = false; // destroy bullet
        alienBullets[i] = null;
        livesNum--; // decrease player life
        if (livesNum <= 0) {
          isDead = true;
          gameOver = true;
        }
      }
    }
  }
  */

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
}
