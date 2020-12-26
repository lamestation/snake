# Instructions

## Add graphics for drawing

Okay, let's add the graphics into our file from the last exercise. We're
going to add a `DAT` block to put it in. Then give it a unique name so
we can reference it, like `dot_gfx`.

**Snake.spin**

```{: .pub}
PUB Main
    lcd.Start(gfx.Start)
    ctrl.Start

+++DAT
+++    dot_gfx
+++    word    0
+++    word    2, 2
+++    word    %%11
+++    word    %%11
```

!!! warning
Due to a temporary bug in LameGFX, you'll need to use this graphic for
the dot.

    ``` {.dat}
    DAT
        dot_gfx
        word    0
        word    2, 2
    ***    word    %%22222211
    ***    word    %%22222211
    ```

    This is because there's no such thing as a graphic 2 pixels wide on the
    LameStation, but LameGFX is filling it with black instead of
    transparent.

## Use graphics to draw screen image

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

```{.pub}
PUB Main
    lcd.Start(gfx.Start)
    ctrl.Start

+++    gfx.Sprite(@dot_gfx, 25, 25, 0)

DAT
    dot_gfx
    word    0
```

## Send the image to the screen

If you try running it now, you still won't see anything. You need
`lcd.Draw` to actually draw to the screen.

**Snake.spin**

```{.pub}
PUB Main
    lcd.Start(gfx.Start)
    ctrl.Start

    gfx.Sprite(@dot_gfx, 25, 25, 0)
+++    lcd.Draw

DAT
    dot_gfx
    word    0
```

!!! note "`dot_gfx` does not equal `@dot_gfx`"

    `@` is the address operator, and it changes the meaning of a variable
    or label.

    - `dot_gfx` is the value at `dot_gfx`.

    - `@dot_gfx` is the address of `dot_gfx`, or where it is in memory.

    See for yourself. Try removing the \'@\' symbol from your code and see
    what happens.

At this point, you should have a very exciting dot on the screen.

**NEXT TIME: We get a move on and make this dot go somewhere.**
