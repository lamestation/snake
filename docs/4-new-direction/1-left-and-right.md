# Step 1: Left And Right

The snake is always moving in one direction, and we need to remember
which direction that is.

An easy way to do that is by assigning a number to each direction.
Because we're sane human beings, let's come up with a scheme that's easy
to remember. Let's use a compass as a reference, and assign 0 to North,
1 to East, 2 to South, and 3 to West.

<figure>
    <img src="../images/compass.png" />
</figure>

We can then create constants to make working with direction easier. Add
them to our `CON` block from before.

**Snake.spin**

```spin hl_lines="5-8"
CON
    _clkmode = xtal1 + pll16x
    _xinfreq = 5_000_000

    UP    = 0
    RIGHT = 1
    DOWN  = 2
    LEFT  = 3

OBJ
    lcd  : "LameLCD"
```

Now we gotta track that number in a variable. There are only four
directions, so byte-sized is plenty large. Let's add a variable called
`snakedir` to our `VAR` block from before.

**Snake.spin**

```spin hl_lines="5"
VAR
    byte    snakex
    byte    snakey

    byte    snakedir

PUB Main
    lcd.Start(gfx.Start)
```

Now here comes a big change. In the last exercise, we directly
controlled the snake with LameControl:

```spin
        if ctrl.Left and snakex > 0
            snakex--
        if ctrl.Right and snakex < constant(128-2)
            snakex++
        if ctrl.Up and snakey > 0
            snakey--
        if ctrl.Down and snakey < constant(64-2)
            snakey++
```

We're going to change that code a lot. We will control only the
_direction_ with LameControl, and then have the movement code look at
`snakedir` only to decide how the snake should move.

I know it looks like a lot of code, but it's the same logic repeated 4
times, one for each direction. Just try not to make a typo.

**Snake.spin**

```spin hl_lines="5-12 14 16 18 20"
    repeat
        gfx.Clear
        ctrl.Update

        if ctrl.Up
            snakedir := UP
        if ctrl.Right
            snakedir := RIGHT
        if ctrl.Down
            snakedir := DOWN
        if ctrl.Left
            snakedir := LEFT

        if snakedir == LEFT and snakex > 0
            snakex--
        if snakedir == RIGHT and snakex < constant(128-2)
            snakex++
        if snakedir == UP and snakey > 0
            snakey--
        if snakedir == DOWN and snakey < constant(64-2)
            snakey++

        gfx.Sprite(@dot_gfx, snakex, snakey, 0)
        lcd.Draw
```

The first thing you'll notice is that now the dot seems to have a mind
of its own! This is because we programmed it to move if it has a
direction, and it always does.
