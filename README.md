[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/Mfyqb_T6)
# NeXtCS Project 01
### thinker0: Andrew Zhao
### thinker1: Weifen Chen
---

### Overview
Your mission is create either:
- Life-like cellular automata [life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), [life-like](https://en.wikipedia.org/wiki/Life-like_cellular_automaton), [demo](https://www.netlogoweb.org/launch#https://www.netlogoweb.org/assets/modelslib/Sample%20Models/Computer%20Science/Cellular%20Automata/Life.nlogo).
- Breakout/Arkanoid [demo 0](https://elgoog.im/breakout/)  [demo 1](https://www.crazygames.com/game/atari-breakout)
- Space Invaders/Galaga

This project will be completed in phases.  
The first phase will be to work on this document. 
* Use markdown formatting.
* For more markdown help
  - [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or
  - [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)


---

## Phase 0: Selection, Analysis & Plan

#### Selected Project: Space Invaders

### Necessary Features
What are the core features that your program should have? These should be things that __must__ be implemented in order to make the program useable/playable, not extra features that could be added to make the program more interesting/fun.

- keyboard interactivity
- score board
- targets that move
- shooters

### Extra Features
What are some features that are not essential to the program, but you would like to see (provided you have time after completing the necessary features. Theses can be customizations that are not part of the core requirements.

- custom shooters
- upgrades
- multiplayer, player 1 controls a tank with WASD and spacebar, player 2 controls a tank with arrow keys and mouse.

### Array Usage
How will you be using arrays in this project?

1D Array:
- number of barriers
- number of bullets

2D Array:
- positions of aliens in grid
- shooter grid


### Controls
How will your program be controlled? List all keyboard commands and mouse interactions.

Keyboard Commands:
- enter, space to shoot
- arrow keys & WASD to move

Mouse Control: N/A for now
- Mouse movement:
- Mouse pressed:


### Classes
What classes will you be creating for this project? Include the instance variables and methods that you believe you will need. You will be required to create at least 2 different classes. If you are going to use classes similar to those we've made for previous assignments, you will have to add new features to them.

CLASS main
- Instance variables:
  - alien [][] grid; stores alien's x and y coords.
  - shooter player; the tank you control.
  - barrier [] shields; stores the number of shields protecting you.
  - projectile [] bullets; stores the bullets that you fire at the aliens.
  - projectile [] alienBullets; stores the bullets the aliens fire at you.
  - int roundNum; stores the round number.
  - int lives; stores the number of lives.
  - int score; stores your total score.
  - int alienMoveSpeed; how many pixels aliens move.
  - int alienMoveTimer; the time it takes between each alien move.
  - int playerMoveSpeed; how many pixels the player moves.
  - boolean gameOver; tracks if the game is over or not.
  - boolean dead; tracks if the player is dead or not.
    
- METHODS
  - void keyPressed()
      - When space / enter is pressed shoot a projectile with the makeProjectile method.
      - A move function that moves the player whenever w,a,s,d or arrow keys are pressed by changing the player's center x value by playerMoveSpeed.
      - When r is pressed reset the game with reset().
        
  - void setup()
      - Calls startGame(); starts the game.
        
  - void draw()
  - If the game is not over or player is not dead,
      - If all aliens are dead, call roundOver().
      - Calls makeBullet(projectile [] bullets, shooter player) to make player bullets.
      - Calls makeAlienBullet(projectile [] alienBullets, alien [][] grid) to make alien bullets.
      - Calls projectile[i].move to make bullets move.
      - Calls processBulletCollisions(projectile [] bullets, alien [][] grid) to process collisions of bullets.
      - Calls processAlienBulletCollisions(projectile [] alienBullets, player, barrier [] shields) to process collisions of alienBullets
      - Calls GameOver(lives) to check if the game is over.
        // all of these under this basically use for loops to go through their respective indexes and update each index's display.
      - Calls projectile[i].move to make bullets move.
      - Calls projectile[i].display to make bullets display themselves.
      - Calls player.display to make the player display themselves.
      - Calls drawAliens(alien [][] grid) to make the aliens display themselves.
      - Calls displayBarrier (barrier [] shields) to make the barriers display themselves.

  - void startGame()
    - Constructs classes, barriers, tank, and aliens, and initializes global variables.
    - sets the size.
    - sets the background.
    - sets frameRate.
  - void roundOver()
    - resets number of lives to max amount,
    - respawns barriers, the tank, and aliens.
    - rounds++;
  - void GameOver(life)
    - If life = 0 then gameOver = true.
  - void dead(isDead)
    - If dead = true then player is respawned, and makes lives counter go down by 1.
  - void makeBullet(projectile [] b, shooter p)
    - uses a for loop to create bullets stored in the bullets array.
  - void makeAlienBullet(projectile [] b, alien [][] g)
    - uses a for loop to create alien bullets stored in the alienBullets array.
  - void processCollisions (projectile [] b, alien [][] g)
    - uses for loops to check if a bullet has overlapped with an alien. If so, the alien that is hit dies.
    - uses for loops to check if a alien is touching the ground. If so, then the game is over.
  - void processAlienBulletCollisions(projectile [] b, shooter p, barrier [] s)
    - uses for loops to check if a bullet has overlapped with a player or a barrier. If so, the barrier loses hp or the player dies.
  - void GameOver(lives)
    - If lives = 0 then clears everything and creates a death screen displaying the final score aswell as some text that says "Press R to try again!".
  - void reset()
    - resets the classes and all variables, and calls startGame() again.

class Player

VARS
PVector center; center of the Player.
int moveSpeed; player movespeed.

Constructor
	Player(PVector c, int speed)
Instantiates variables.
Creates PVector center to contain the x and y coords of the center.
Methods
boolean collisionCheck(AlienBullet other)
Checks for collisions using distance between the head of an AlienBullet and the center of the Shooter.
void move()
Moves the shooter using the center values and the moveSpeed.
void display()
Displays the shooter on the screen using the center values.

class Alien
Instance variables:
  PVector center; 
  int moveSpeed;
  int shootSpeed;
boolean chocolateCovered;

Constructor
  Alien(PVector c, boolean chocolateCovered)
    Instantiates variables.
    Creates PVector center
    Determines whether an alien is chocolate covered.
METHODS
  void Alien()
    Instantiates variables.
  boolean collisionCheck(AlienBullet other, PlayerBullet other, Player other)
    Checks for collisions using distance between the head of a bullet and the center of an alien.
    Also checks if the alien is touching the ground. If so, the game ends.
  void move()
    Moves the alien using the center values and also alien moveSpeed.
  void display()
    Displays the alien on the screen using the center values as well as any modifier values.


Class Barrier
// banana slices?

VARS
  Pvector center; //center of the barrier
  int stage; // the stage of destruction the barrier is at.

CONSTRUCTOR
  Barrier(PVector c, int s)
  Instantiates variables.
  Creates a PVector center that stores the x and y variables of the center.
  sets the stage of the breakage.
METHODS
  boolean collisionCheck(Alien Bullet other, PlayerBullet other)
    Checks for collisions using distance between the head of a bullet and the center of an alien.
    Also checks if the alien is touching the ground. If so, the game ends.
  void destruction
    Makes the barrier crack when hit with a bullet.
  void display()
    Displays the alien on the screen using the center values as well as any modifier values.

class PlayerBullet

VARS
  int ySpeed; //speed of the PlayerBullet.
  PVector head; //the head of the bullet.

Constructor
	-PlayerBullet(PVector h, int speed)
    -Instantiates the ySpeed
    -Creates a new PVector storing the x and y values of the bullet’s head.
METHODS
  -void move() 
		- moves the bullet by changing its PVector.y value according to ySpeed
	
  -  boolean collisionCheck (Barrier other, Alien other)
	  	- Checks for collisions with barriers and the aliens.
	- void display(PVector h)
		- displays the bullet on the screen according to PVector head values.

// knives?

class AlienBullet

VARS
  int ySpeed; //speed of the alienBullet.
  PVector head; // the head of the bullet.

Constructor
	-AlienBullet(PVector h, int speed)
    -Instantiates the ySpeed
    -Creates a new PVector storing the x and y values of the bullet’s head.
METHODS
  -void move() 
		- moves the bullet by changing its PVector.y value according to ySpeed
	
  -  boolean collisionCheck (Barrier other, Player other)
		- Checks for collisions with barriers and the Player.
	- void display(PVector h)
		- displays the bullet on the screen according to PVector head values.

// strawberry seeds



