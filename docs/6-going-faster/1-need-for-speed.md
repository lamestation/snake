# Step 1: Need for speed

As it would happen, there isn't much to do to make this happen. First,
we create a constant, just to make our lives easier.

**Snake.spin**

```spin hl_lines="6"
    DOWN  = 2
    LEFT  = 3

    MAX_LENGTH = 256

    SPEED = 2

OBJ
    lcd  : "LameLCD"
```

Now we need to replace every instance of `++` and `--` with `+= SPEED`
and `-= SPEED`.

These are shorter ways of writing certain operations that make your code
easier to read.

```
x += y    ===>    x := x + y
x -= y    ===>    x := x - y
x *= y    ===>    x := x * y
x /= y    ===>    x := x / y
```

Here's what your movement code should look like now.

**Snake.spin**

```spin hl_lines="5 7 9 11"
            if ctrl.Right
                snakedir := RIGHT

        if snakedir == LEFT and snakex[0] > 0
            snakex[0] -= SPEED
        if snakedir == RIGHT and snakex[0] < constant(128-2)
            snakex[0] += SPEED
        if snakedir == UP and snakey[0] > 0
            snakey[0] -= SPEED
        if snakedir == DOWN and snakey[0] < constant(64-2)
            snakey[0] += SPEED

        gfx.Sprite(@dot_gfx, snakex[0], snakey[0], 0)
```

Ahh! Now it goes way, way fast at the beginning! I can hardly even see
it. We can fix that, though.
