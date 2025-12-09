Feedback from MST

Cool things:

    I love how you named your variables, it's really clear what each does before i even saw the code it was connected to
    Class barrier looks really interesting

Clarifying Qs:

    can gameOver and roundOver be just one function instead of two separate ones?
    upgrades and stuff might be hard to implement, how do you plan on doing that?

Suggestions:
-Maybe you can put dead(isDead) as a part of another function instead of letting it stand on its own?
-maybe simplify some function names so it's not as long (ie. processAlienBulletCollisions is preeetty long)

-------

-Answers to clarifying questions:

I think it is better to have gameOver and roundOver be in seperate functions because one is resetting the whole game while the other is just resetting the alien's positions and respawning the player. While they are similar I dont want to be confused with the same function for two things.

We are planning on implementing upgrades by treating an upgrade as a boolean value, like if isShield is true then there is a shield, but once it is hit then the value is false and the display updates accordingly.

-Answers to suggestions:
    The isDead function will be in the gameOver function! sorry if that was not clear.
    I understand the function names are long, we may shorten them but for now I like them because its very hard to get confused and its easy to remember the function names because they do exactly what the title is.

-------------------------
Jed Sloan & Mohammed


Cool things:

    Nice job specifying return type and parameters of methods.
    Nice specificity of global variables.

Clarifying Qs:

    Why are we creating seperate methods for player and alien bullets?
    Will projectile be an encapsulated or public array?

Suggestions:

    I would like to see a flowchart implemented.
    Void destruction algorithm should be less vague.

---------------------

changes made:

we plan to make both the Player and Alien bullets in the same class. The player and alien bullets will be separated by a value determining whether the projectile is an alien or player bullet like int bulletVal.

    

    
