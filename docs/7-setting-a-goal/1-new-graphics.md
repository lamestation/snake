# Step 1: New Graphics

Let's make the food a different color, so it'll be easier to spot. These
graphics are just as exciting as the snake's.

**Snake.spin**

```spin hl_lines="8-12"
DAT
    dot_gfx
    word    0
    word    2, 2
    word    %%22222211
    word    %%22222211

    food_gfx
    word    0
    word    2, 2
    word    %%22222233
    word    %%22222233
```

Then we gotta keep track of the food's position on the screen
("foody", lol).

**Snake.spin**

```spin hl_lines="4-5"
    byte    snakedir
    byte    snakecount

    byte    foodx
    byte    foody

    byte    i
```
