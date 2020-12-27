# Step 1: Global Positioning

We want to move the pixel around on the screen, but in order to do that,
we have to keep track of its location somehow.

To do that, we can use variables for its horizontal (`snakex`) and
vertical (`snakey`) positions.

**Snake.spin**

```spin hl_lines="3-5"
    ctrl : "LameControl"

VAR
    byte    snakex
    byte    snakey

PUB Main
    lcd.Start(gfx.Start)
```

Now, remember our `gfx.Sprite` function from before? Change it to use
the new variables for position instead of numbers.

```spin hl_lines="5"
PUB Main
    lcd.Start(gfx.Start)
    ctrl.Start

    gfx.Sprite(@dot_gfx, snakex, snakey, 0)
    lcd.Draw
```

Run it. The dot should now be in the top-left. This is because variables
are set to zero when you first turn on the system.
