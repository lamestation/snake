# Step 1: No crossing

The change is simple enough. We want the snake to die if it crosses over
itself. This can be accomplished by checking each pixel of the snake to
see if it overlaps with the head.

```spin
if snakex[i] == snakex[0] and snakey[i] == snakey[0]
```

Then if true, we make sure to tie up all the loose ends, so that the
snake starts over fresh.

```spin
if snakex[i] == snakex[0] and snakey[i] == snakey[0]
    snakecount := 1
    snakex[0] := 64
    snakey[0] := 32
    snakedir := 1
```

We just need to add it into the loop we've already created that moves
the entire snake every frame.

**Snake.spin**

```spin hl_lines="4-9"
        gfx.Sprite(@dot_gfx, snakex[0], snakey[0], 0)

        repeat i from snakecount to 1
            if snakex[i] == snakex[0] and snakey[i] == snakey[0]
                snakecount := 1
                snakex[0] := 64
                snakey[0] := 32
                snakedir := 1

            snakex[i] := snakex[i-1]
            snakey[i] := snakey[i-1]
            gfx.Sprite(@dot_gfx, snakex[i], snakey[i], 0)

        lcd.Draw
```

Done. Now your snake will suffer an untimely fate for its carelessness.
