# Step 3: Draw the screen

If you try running it now, you still won't see anything. You need
`lcd.Draw` to actually draw to the screen.

**Snake.spin**

```spin hl_lines="6"
PUB Main
    lcd.Start(gfx.Start)
    ctrl.Start

    gfx.Sprite(@dot_gfx, 25, 25, 0)
    lcd.Draw

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
