# Instructions

## Global Positioning

We want to move the pixel around on the screen, but in order to do that,
we have to keep track of its location somehow.

To do that, we can use variables for its horizontal (`snakex`) and
vertical (`snakey`) positions.

**Snake.spin**

```{.obj}
    ctrl : "LameControl"

+++VAR
+++    byte    snakex
+++    byte    snakey

PUB Main
    lcd.Start(gfx.Start)
```

Now, remember our `gfx.Sprite` function from before? Change it to use
the new variables for position instead of numbers.

```{.pub}
PUB Main
    lcd.Start(gfx.Start)
    ctrl.Start

***    gfx.Sprite(@dot_gfx, snakex, snakey, 0)
    lcd.Draw
```

Run it. The dot should now be in the top-left. This is because variables
are set to zero when you first turn on the system.

## Correct The Dots

If you want it elsewhere, you have to set it to equal another point
using `:=`. The LameStation screen is 128x64 pixels, so let's set it to
(32,32).

**Snake.spin**

    PUB Main
        lcd.Start(gfx.Start)
        ctrl.Start

    +++    snakex := 32
    +++    snakey := 32

        gfx.Sprite(@dot_gfx, snakex, snakey, 0)

That puts the dot squarely in the center. Cool, but sitting in one place
is boring. So let's move it around!

## If You Say So

We'll use LameControl to access the joystick. The LameControl commands
return `true` if a button or direction is pressed, or `false`.

The `IF` keyword allows us to test if an expression is true, and if so,
run some code. The code to run should be immediately after the `IF` and
indented.

    if condition
        ' put code to execute if true here
    else
        ' put code to execute if false here

None of the functions will return anything until `ctrl.Update` is
called, so make sure to call it first.

**Snake.spin**

```{.pub}
    snakex := 32
    snakey := 32

+++    ctrl.Update
+++
+++    if ctrl.Left
+++        snakex--
+++    if ctrl.Right
+++        snakex++
+++    if ctrl.Up
+++        snakey--
+++    if ctrl.Down
+++        snakey++

    gfx.Sprite(@dot_gfx, snakex, snakey, 0)
    lcd.Draw
```

## Feeling Loopy

Awesome. We should be ready to go, right? Wrong!

There's one thing missing. You see, the most you'll ever be able to move
the dot is by one pixel. That's because our code is only run once. If
you really want to see it move, you need a _loop_, or code that will run
over and over again. Spin has the `repeat` command for this.

    repeat
        foo(bar)

To put your code inside a `repeat`, just put it after and indent it, and
it'll loop forever! Don't just put the controls though. You need the
drawing code too, like this.

**Snake.spin**

```{.pub}
    snakex := 32
    snakey := 32

***    repeat
***        ctrl.Update
***
***        if ctrl.Left
***            snakex--
***        if ctrl.Right
***            snakex++
***        if ctrl.Up
***            snakey--
***        if ctrl.Down
***            snakey++
***
***        gfx.Sprite(@dot_gfx, snakex, snakey, 0)
***        lcd.Draw
```

You'll notice right away something really wonky. The snake is leaving a
giant trail of snake behind it, to the point that this seems more like a
paint program.

![](images/noclear.png)

`gfx.Clear` to the rescue! This command clears the screen to black, and
should be called any time you need to _reset_ the screen. Usually the
best place for it is the beginning of the loop.

**Snake.spin**

```{.pub}
    snakex := 32
    snakey := 32

    repeat
+++        gfx.Clear
        ctrl.Update

        if ctrl.Left
            snakex--
```

## Put A Lid On It

This is cool, except the snake is able to just wander outside of the
screen whenever it feels like. Let's show that snake who's boss by
keeping it inside the screen.

We'll use the `AND` keyword so that we can test two expressions at once.
Then we will test that there is enough space for the dot to move before
moving there.

We can make sure the snake stays inside the left and top edges of the
screen by making sure its position is greater than or equal to zero.

```{.pub}
        if ctrl.Left and snakex > 0
            snakex--
```

Testing the right and bottom edges is more complicated. Since a image's
position is its top-left corner, we must subtract its size from the
edge.

```{.pub}
        if ctrl.Right and snakex < constant(128-2)
            snakex++
```

Changing all four sides in the code.

**Snake.spin**

```{.pub}
    snakex := 32
    snakey := 32

    repeat
        ctrl.Update

***        if ctrl.Left and snakex > 0
            snakex--
***        if ctrl.Right and snakex < constant(128-2)
            snakex++
***        if ctrl.Up and snakey > 0
            snakey--
***        if ctrl.Down and snakey < constant(64-2)
            snakey++

        gfx.Sprite(@dot_gfx, snakex, snakey, 0)
        lcd.Draw
```

And now you have a spiffy pet dot with a fancy enclosed box to play in.

**NEXT TIME: We're taking this dot in a whole new direction. See where
it takes us!**
