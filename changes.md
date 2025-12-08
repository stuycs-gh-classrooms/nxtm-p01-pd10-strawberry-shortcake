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
