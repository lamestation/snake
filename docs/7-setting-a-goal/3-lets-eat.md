# Step 3: Let's eat!

Right now, you should have code that looks something like this, from
this and a previous exercise:

**Snake.spin**

```spin
        if ctrl.A
            if snakecount < constant(MAX_LENGTH-1)
                snakecount++

        if ctrl.B
            foodx := ||random? // 64 * 2
            foody := ||random? // 32 * 2
```

Both of those actions need to be combined into one. That is, when the
snake takes a bite:

1.  The snake should grow longer by one dot.

2.  The food should reappear in a new location.

To do that, we will replace the `ctrl.A` and `ctrl.B` tests with a test
that is only true when the snake's head and the food pellet are in the
same place.

```spin
if foodx == snakex[0] and foody == snakey[0]
```

Then we combine them into one.

**Snake.spin**

```spin hl_lines="5-10"
    repeat
        gfx.Clear
        ctrl.Update

        if foodx == snakex[0] and foody == snakey[0]
            if snakecount < constant(MAX_LENGTH-1)
                snakecount++

            foodx := ||random? // 64 * 2
            foody := ||random? // 32 * 2

        gfx.Sprite(@food_gfx, foodx, foody, 0)
```

Remember to initialize the food position at startup too! Otherwise it
will always start in the top-left corner of the screen.

**Snake.spin**

```spin hl_lines="4-5"
    snakedir := 1
    snakecount := 1

    foodx := ||random? // 64 * 2
    foody := ||random? // 32 * 2

    repeat
        gfx.Clear
```

Now our entire foody system should be complete (lol, foody).
