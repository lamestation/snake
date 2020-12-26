# Quiz

![](images/quiz.jpg)

1.  What is LameLCD? What is LameGFX?

1.  What happens when you try to draw graphics off the screen?

1.  How can you draw a sprite in multiple places on the screen?

1.  In this tutorial, we used the following command to draw the snake’s head:

    ```
    gfx.Sprite(@dot_gfx, snakex[0], snakey[0], 0)
    ```

    What happens if `@dot_gfx` is replaced with zero (`0`)? Why?

1.  When we were setting the boundaries of the screen, we used the code
    `constant(128-2)` and `constant(64-2)` for the right and bottom edges.

    1.  Why are we subtracting `2` from the right and bottom edges, but not
        from the top or left edges?

    1.  What do you think the `constant()` keyword does?

1.  List two possible ways to speed up the snake. (They don’t have to be good ways).

1.  When you start the game, and when you eat a food pellet, a new one is
    randomly generated anywhere on the map.

    1.  What would happen if the food appeared where the snake already was?

    1.  What can you do to prevent that from happening?

1.  We wrote code for two features while making our game:

    - The snake dies when it overlaps itself.

    - The snake can't travel off-screen.

    However, there's one feature that we never implemented:

    - The snake dies when you try to travel off-screen.

    But that's what's happening. Why do you think that is?
