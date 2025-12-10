class Main {
  int score;
  int livesNum;
  int roundNum;
  
  int alienMoveSpeed;
  int alienMoveTimer;
  
  int playerMoveSpeed;
  
  boolean isDead;
  boolean roundOver;
  boolean gameOver;
  
  void keyPressed() {
    if(key == 'r') {
      startGame();
    }
    if(key == ' ' || keyCode == ENTER) {
      makeProjectile();
    }
  }
  
  void gameRestart() {
    //calls startGame() 
  }
  
  void startGame() {
    int score = 0;
    int roundNum = 1;
    int livesNum = 3;
   
   //set boolean roundOver and gameOver to false
    boolean isDead = false;
    boolean roundOver = false;
    boolean gameOver = false;
   
   //calls setup()
  }
  
  
  
  
  
  
  
  
  
}
