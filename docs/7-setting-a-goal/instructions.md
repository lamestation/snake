# Instructions

## New Graphics

Let's make the food a different color, so it'll be easier to spot. These
graphics are just as exciting as the snake's.

**Snake.spin**

```{.dat}
DAT
    dot_gfx
    word    0
    word    2, 2
    word    %%22222211
    word    %%22222211

+++    food_gfx
+++    word    0
+++    word    2, 2
+++    word    %%22222233
+++    word    %%22222233
```

Then we gotta keep track of the food's position on the screen
(\"foody\", lol).

**Snake.spin**

```{.var}
    byte    snakedir
    byte    snakecount

+++    byte    foodx
+++    byte    foody

    byte    i
```

## Random Food

Now, every time we get the food pellet, it has to reappear in a new
location. For that, we need the _random_ operator! Setting it up may not
make sense at first, but it's pretty simple. First, we need a variable.

**Snake.spin**

```{.var}
    byte    foodx
    byte    foody

+++    byte    random
    byte    i
```

First, we need to initialize it with a starting value. The system clock
works perfectly for this.

**Snake.spin**

```{.pub}
PUB Main
    lcd.Start(gfx.Start)
    lcd.SetFrameLimit (lcd#HALFSPEED)
    ctrl.Start

+++    random := cnt

    snakex[0] := 32
    snakey[0] := 32
```

After that, we can grab random values from the `random` variable using
the `?` operator. Use the following code to test it out.

**Snake.spin**

```{.pub}
    repeat
        gfx.Clear
        ctrl.Update

+++        if ctrl.B
+++            foodx := random?
+++            foody := random?
+++
+++        gfx.Sprite(@food_gfx, foodx, foody, 0)

        if snakedir == LEFT or snakedir == RIGHT
            if ctrl.Up
```

Problem. It seems to only work part of the time; sometimes dot,
sometimes no dot. That's because `random?` is a byte, and can return
random values between 0 and 255, so we need to limit its range. Modulo
is perfect for this.

**Snake.spin**

```{.pub}
        if ctrl.B
***            foodx := random? // 128
***            foody := random? // 64
```

It still only works half the time! This is because `random` is a byte,
and for arithmetic, if it holds a value greater than 127, it's actually
a negative number, so it won't ever appear on the screen. We can
sidestep this problem with the _absolute value_ (`||`) operator. It
forces the number to be positive, so our range will appear on the
screen.

**Snake.spin**

```{.pub}
        if ctrl.B
***            foodx := ||random? // 128
***            foody := ||random? // 64
```

There's still one problem though. Our snake is positioned every two
pixels, but the food can be anywhere. Let's fix that.

**Snake.spin**

```{.pub}
        if ctrl.B
***            foodx := ||random? // 64 * 2
***            foody := ||random? // 32 * 2
```

Perfect! Now we just have the problem of putting it all together.

## Let's eat!

Right now, you should have code that looks something like this, from
this and a previous exercise:

**Snake.spin**

```{.pub}
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

```{.pub}
        if foodx == snakex[0] and foody == snakey[0]
```

Then we combine them into one.

**Snake.spin**

```{.pub}
    repeat
        gfx.Clear
        ctrl.Update

***        if foodx == snakex[0] and foody == snakey[0]
***            if snakecount < constant(MAX_LENGTH-1)
***                snakecount++
***
***            foodx := ||random? // 64 * 2
***            foody := ||random? // 32 * 2

        gfx.Sprite(@food_gfx, foodx, foody, 0)
```

Remember to initialize the food position at startup too! Otherwise it
will always start in the top-left corner of the screen.

**Snake.spin**

```{.pub}
    snakedir := 1
    snakecount := 1

+++    foodx := ||random? // 64 * 2
+++    foody := ||random? // 32 * 2

    repeat
        gfx.Clear
```

Now our entire foody system should be complete (lol, foody).