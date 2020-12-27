# Step 2: Draw the image

Drawing is done with the `gfx.Sprite` command. It has four arguments,
which control how it will behave.

!!! info "New Command: `gfx.Sprite`"

    Draw an image to the screen.

    ```
    gfx.Sprite(source, x, y, frame)
    ```

    **Arguments**

    - **source** - the graphics to draw

    - **x**, **y** - the position of the graphics (top-left corner)

    - **frame** - the number of frames

So the source should be the address of the graphics we made before.

The screen is 128x64 pixels, so you have to draw the dot between (0,0)
and (128,64) for it to be visible. Other than that, we don't really care
where it shows up yet.

We're not using the frame parameter yet, so just set it to zero.

**Snake.spin**

```spin hl_lines="5"
PUB Main
    lcd.Start(gfx.Start)
    ctrl.Start

    gfx.Sprite(@dot_gfx, 25, 25, 0)

DAT
    dot_gfx
    word    0
```
