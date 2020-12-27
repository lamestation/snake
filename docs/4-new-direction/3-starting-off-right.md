# Step 3: Starting Off Right

One final change. Since there is more room horizontally than vertically,
we'll make life slightly easier by changing the starting direction to
right. This will give the player more time to react before hitting a
wall.

**Snake.spin**

```spin hl_lines="4"
    snakex := 32
    snakey := 32

    snakedir := 1

    repeat
        gfx.Clear
        ctrl.Update
```
