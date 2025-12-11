Alien strawberry;
Player tank;
Barrier shield;

Bullet[] playerBullets = new Bullet[100];
Bullet[] alienBullets = new Bullet[100];

  int score;
  int livesNum;
  int roundNum;
  
  int alienMoveSpeed;
  int alienMoveTimer;
  
  int playerMoveSpeed;
  
  float bulletCoolDown; //bullet cooldown in frames.
  
  boolean isDead;
  boolean roundOver;
  boolean gameOver;
  void setup() {
    startGame();
    size(500,500);
  }
  
  void draw() {
    if (gameOver == false) {
      if (roundOver == false) {
        genBackground();
        tank.display();
      if (playerBullets != null) {
      for (int i = 0; i < playerBullets.length; i++) {
        if (playerBullets[i] != null && playerBullets[i].alive) {
          playerBullets[i].move();
          playerBullets[i].display();
        }
      }
      }
      }
            
      }
    } 
  void keyPressed() {
    if(key == 'r') {
      startGame();
    }
     if ((key == ' ' || keyCode == ENTER) && bulletCoolDown == 0) {
       makePlayerBullet();
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
    bulletCoolDown = 0;
   
   //set boolean roundOver and gameOver to false
    isDead = false;
    roundOver = false;
    gameOver = false;
    
    genBackground();
    makePlayer(tank);
  }
  
  void makePlayer(Player p) {
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
  
  
  void outOfBounds() {
    
  }
  
  void genBackground () {
    background(255);
    fill(255,0,0);
    rect(0,450,width,height);
    
  }
  
  int findAvailableIndex(Bullet[] b) {
  for (int i = 0; i < 100; i++) { // checks every index in bs.
    if (b[i] == null) { // if there is nothing, then return the index number
      return i;
    }
  }
  return -1; // if there is something return -1
}//findAvailableIndex
