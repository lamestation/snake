# Step 3: Lining them up

What we need to do is make each and every dot follow the one that came
before it in a line. That's easy enough. The position of the next
position should equal the position of the last.

```spin
snakex[i] := snakex[i-1]
```

So how do we go over all the points of the snake so that this will work?
There's two options:

## Option 1: Front to back

We start from the front of the snake and go to the end.

```spin
repeat i from 1 to snakecount
```

If we run these commands in order:

```spin
snakex[1] = snakex[0]
snakex[2] = snakex[1]
snakex[3] = snakex[2]
```

This doesn't work. When you simplify it, you end up with this:

```spin
snakex[3] = snakex[2] = snakex[1] = snakex[0]
```

In other words, a single dot. Lame.

## Option 2: Back to front

We can also try starting from the back of the snake and going to the
front.

```spin
repeat i from snakecount to 1
```

You'll see that running it this way yields the result we want.

```spin
snakex[3] = snakex[2]
snakex[2] = snakex[1]
snakex[1] = snakex[0]
```

In other words, `snakex[3]` is the old value of `snakex[2]`, `snakex[2]`
is the old value of `snakex[1]`, and `snakex[1]` is the old value of
`snakex[0]`.

Well, gee, that's just what we want!

There is only one value that isn't set this way, and that's `snakex[0]`.
That's okay though, because we already set `snakex[0]` via player
direction.

Here's the code that calculates the locations of the snake's tail. We
should place this code after drawing the first snake sprite but before
`lcd.Draw`.

**Snake.spin**

```spin hl_lines="6-8"
        if snakedir == DOWN and snakey[0] < constant(64-2)
            snakey[0]++

        gfx.Sprite(@dot_gfx, snakex[0], snakey[0], 0)

        repeat i from snakecount to 1
            snakex[i] := snakex[i-1]
            snakey[i] := snakey[i-1]

        lcd.Draw

DAT
    dot_gfx
```

Don't forget, though. We also want to _see_ the tail, so make sure to
include a call to `gfx.Sprite` to draw the tail at each position.

**Snake.spin**

```spin hl_lines="6"
        gfx.Sprite(@dot_gfx, snakex[0], snakey[0], 0)

        repeat i from snakecount to 1
            snakex[i] := snakex[i-1]
            snakey[i] := snakey[i-1]
+++            gfx.Sprite(@dot_gfx, snakex[i], snakey[i], 0)

        lcd.Draw
```

In essence, we now have a snake, not just a single dot, that can move
around the field.
