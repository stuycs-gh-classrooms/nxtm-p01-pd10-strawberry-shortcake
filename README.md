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

#### Link to Planning Doc:
https://docs.google.com/document/d/1zX06kTUGRnORaY0bV2h_JRLYoX1zmd-EoINuLdruGiU/edit?usp=sharing

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
- multiplayer, player 1 controls a tank with WASD and spacebar, player 2 controls a tank with arrow keys and enter/return key
- cake background
- sound effects
- background music (we don't know how to add this) 

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
- enter, spacebar to shoot
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
  - void processBulletCollisions (projectile [] b, alien [][] g)
    - uses for loops to check if a bullet has overlapped with an alien. If so, the alien that is hit dies.
  - void processAlienBulletCollisions(projectile [] b, shooter p, barrier [] s)
    - uses for loops to check if a bullet has overlapped with a player or a barrier. If so, the barrier loses hp or the player dies.
  - void GameOver(lives)
    - If lives = 0 then clears everything and creates a death screen displaying the final score aswell as some text that says "Press R to try again!".
  - void reset()
    - resets the classes and all variables, and calls startGame() again.

CLASS aliens
- Instance variables:
  - LIST INSTANCE VARS HERE
- METHODS
  - LIST METHODS HERE
 
CLASS shooter

CLASS display

CLASS barrier
- Instance variables:
  - 

- METHODS
  - LIST METHODS HERE

CLASS projectile
