# Step 5: Put A Lid On It

This is cool, except the snake is able to just wander outside of the
screen whenever it feels like. Let's show that snake who's boss by
keeping it inside the screen.

We'll use the `AND` keyword so that we can test two expressions at once.
Then we will test that there is enough space for the dot to move before
moving there.

We can make sure the snake stays inside the left and top edges of the
screen by making sure its position is greater than or equal to zero.

```spin
        if ctrl.Left and snakex > 0
            snakex--
```

Testing the right and bottom edges is more complicated. Since a image's
position is its top-left corner, we must subtract its size from the
edge.

```spin
        if ctrl.Right and snakex < constant(128-2)
            snakex++
```

Changing all four sides in the code.

**Snake.spin**

```spin hl_lines="7 9 11 13"
    snakex := 32
    snakey := 32

    repeat
        ctrl.Update

        if ctrl.Left and snakex > 0
            snakex--
        if ctrl.Right and snakex < constant(128-2)
            snakex++
        if ctrl.Up and snakey > 0
            snakey--
        if ctrl.Down and snakey < constant(64-2)
            snakey++

        gfx.Sprite(@dot_gfx, snakex, snakey, 0)
        lcd.Draw
```

And now you have a spiffy pet dot with a fancy enclosed box to play in.

**NEXT TIME: We're taking this dot in a whole new direction. See where
it takes us!**
