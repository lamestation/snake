# Instructions

## Need for speed

As it would happen, there isn't much to do to make this happen. First,
we create a constant, just to make our lives easier.

**Snake.spin**

```{.con}
    DOWN  = 2
    LEFT  = 3

    MAX_LENGTH = 256

+++    SPEED = 2

OBJ
    lcd  : "LameLCD"
```

Now we need to replace every instance of `++` and `--` with `+= SPEED`
and `-= SPEED`.

These are shorter ways of writing certain operations that make your code
easier to read.

    x += y    ===>    x := x + y
    x -= y    ===>    x := x - y
    x *= y    ===>    x := x * y
    x /= y    ===>    x := x / y

Here's what your movement code should look like now.

**Snake.spin**

```{.pub}
            if ctrl.Right
                snakedir := RIGHT

        if snakedir == LEFT and snakex[0] > 0
***            snakex[0] -= SPEED
        if snakedir == RIGHT and snakex[0] < constant(128-2)
***            snakex[0] += SPEED
        if snakedir == UP and snakey[0] > 0
***            snakey[0] -= SPEED
        if snakedir == DOWN and snakey[0] < constant(64-2)
***            snakey[0] += SPEED

        gfx.Sprite(@dot_gfx, snakex[0], snakey[0], 0)
```

Ahh! Now it goes way, way fast at the beginning! I can hardly even see
it. We can fix that, though.

## Wait for me!

We can make the game more playable by setting the frame rate. That's
when we intentionally limit the speed of the game so that it runs at a
more consistent speed instead of as fast as it feels like at the moment
(a nice thing to have!).

LameLCD has a command just for this: `lcd.SetFrameLimit`. It comes in
three speeds.

- `FULLSPEED` (\~35 frames/second): Like you're watching TV!

- `HALFSPEED` (\~18 frames/second): Starting to look choppy.

- `QUARTERSPEED` (\~9fps frames/second): Pretty freaking slow.

You can try different values to see how they look; which one you use
really depends on your game.

I'm going to go with `HALFSPEED`. You can call it whenever you like to
change the frame rate, but I like to set it once at the beginning to
keep it simple.

**Snake.spin**

```{.pub}
PUB Main
    lcd.Start(gfx.Start)
+++    lcd.SetFrameLimit (lcd#HALFSPEED)
    ctrl.Start
```
