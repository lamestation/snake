# Step 2: Random Food

Now, every time we get the food pellet, it has to reappear in a new
location. For that, we need the _random_ operator! Setting it up may not
make sense at first, but it's pretty simple. First, we need a variable.

**Snake.spin**

```spin hl_lines="4"
    byte    foodx
    byte    foody

    byte    random
    byte    i
```

First, we need to initialize it with a starting value. The system clock
works perfectly for this.

**Snake.spin**

```spin hl_lines="6"
PUB Main
    lcd.Start(gfx.Start)
    lcd.SetFrameLimit (lcd#HALFSPEED)
    ctrl.Start

    random := cnt

    snakex[0] := 32
    snakey[0] := 32
```

After that, we can grab random values from the `random` variable using
the `?` operator. Use the following code to test it out.

**Snake.spin**

```spin hl_lines="5-9"
    repeat
        gfx.Clear
        ctrl.Update

        if ctrl.B
            foodx := random?
            foody := random?

        gfx.Sprite(@food_gfx, foodx, foody, 0)

        if snakedir == LEFT or snakedir == RIGHT
            if ctrl.Up
```

Problem. It seems to only work part of the time; sometimes dot,
sometimes no dot. That's because `random?` is a byte, and can return
random values between 0 and 255, so we need to limit its range. Modulo
is perfect for this.

**Snake.spin**

```spin hl_lines="2-3"
        if ctrl.B
            foodx := random? // 128
            foody := random? // 64
```

It still only works half the time! This is because `random` is a byte,
and for arithmetic, if it holds a value greater than 127, it's actually
a negative number, so it won't ever appear on the screen. We can
sidestep this problem with the _absolute value_ (`||`) operator. It
forces the number to be positive, so our range will appear on the
screen.

**Snake.spin**

```spin hl_lines="2-3"
        if ctrl.B
            foodx := ||random? // 128
            foody := ||random? // 64
```

There's still one problem though. Our snake is positioned every two
pixels, but the food can be anywhere. Let's fix that.

**Snake.spin**

```spin hl_lines="2-3"
        if ctrl.B
            foodx := ||random? // 64 * 2
            foody := ||random? // 32 * 2
```

Perfect! Now we just have the problem of putting it all together.
