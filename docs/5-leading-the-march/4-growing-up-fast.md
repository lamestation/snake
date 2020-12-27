# Step 4: Growing up fast

Before we can see it in action, the tail has to get longer. Now, we
could make the tail longer at startup, but that's harder and requires
extra code.

For now, let's just add a little snippet to increase the tail length one
by one, which is close to how it'll work when the game is finished
anyway. You can put it anywhere in the loop, but I choose to group it
with all the other controls.

**Snake.spin**

```spin hl_lines="5-7"
    repeat
        gfx.Clear
        ctrl.Update

+++        if ctrl.A
+++            if snakecount < constant(MAX_LENGTH-1)
+++                snakecount++

        if snakedir == LEFT or snakedir == RIGHT
```

Now your snake is bigger and stronger than ever before!
