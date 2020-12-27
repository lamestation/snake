# Step 2: No U-Turns

All in all, the snake is looking pretty good...​ for a single dot.
There's one more thing we need to add to really move like a snake.
You'll notice that if you are moving in one direction, you can go in the
exact opposite direction, which the snake shouldn't be able to do.

We'll add code to prevent that.

**Snake.spin**

```spin hl_lines="5-15"
    repeat
        gfx.Clear
        ctrl.Update

        if snakedir == LEFT or snakedir == RIGHT
            if ctrl.Up
                snakedir := UP
            if ctrl.Down
                snakedir := DOWN

        elseif snakedir == DOWN or snakedir == UP
            if ctrl.Left
                snakedir := LEFT
            if ctrl.Right
                snakedir := RIGHT

        if snakedir == LEFT and snakex > 0
            snakex--
        if snakedir == RIGHT and snakex < constant(128-2)
            snakex++
```

This code lets you go up/down if you're heading left/right, and vice
versa, but you can't do U-turns. It's a small change, but this a big
part of what makes Snake difficult.
