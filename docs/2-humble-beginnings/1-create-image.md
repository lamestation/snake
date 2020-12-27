# Step 1: Create an image

Okay, let's add the graphics into our file from the last exercise. We're
going to add a `DAT` block to put it in. Then give it a unique name so
we can reference it, like `dot_gfx`.

**Snake.spin**

```spin hl_lines="5-10"
PUB Main
    lcd.Start(gfx.Start)
    ctrl.Start

DAT
    dot_gfx
    word    0
    word    2, 2
    word    %%11
    word    %%11
```

!!! warning

    Due to a temporary bug in LameGFX, you'll need to use this graphic for
    the dot.

    ```spin hl_lines="5-6"
    DAT
        dot_gfx
        word    0
        word    2, 2
        word    %%22222211
        word    %%22222211
    ```

    This is because there's no such thing as a graphic 2 pixels wide on the
    LameStation, but LameGFX is filling it with black instead of
    transparent.
