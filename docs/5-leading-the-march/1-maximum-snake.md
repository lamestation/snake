# Step 1: Maximum snake!

We need to define an array, but first, let's add a constant for the
maximum number of snakes. This is important, because without it, it's
chaos trying to remember how many are allowed throughout your program.

First, decide how long the snake can be. We need to know how big to make
the arrays. 256 seems pretty big, but on a 128x64 screen, there are
**8192 pixels**!

**Snake.spin**

```spin hl_lines="5"
    RIGHT = 1
    DOWN  = 2
    LEFT  = 3

    MAX_LENGTH = 256

OBJ
    lcd  : "LameLCD"
```

We need to turn our `snakex` and `snakey` variables into arrays.

**Snake.spin**

```spin hl_lines="4-5"
    ctrl : "LameControl"

VAR
    byte    snakex[MAX_LENGTH]
    byte    snakey[MAX_LENGTH]

    byte    snakedir
```

We now need to update the syntax of every `snakex` and `snakey`. Find
([Ctrl+F]{.keycombo}) is the fastest way to make this happen.

!!! warning

    Make sure you replace all instances of `snakex` with `snakex[0]` and
    `snakey` with `snakey[0]`. E.g.:

    ```{.pub}
        snakex[0] := 32
        snakey[0] := 32
    ```

    Don't accidentally replace your array declaration:

    ```{.var}
        byte    snakex[0][MAX_LENGTH]
        byte    snakey[0][MAX_LENGTH]
    ```
