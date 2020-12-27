# Step 3: If You Say So

We'll use LameControl to access the joystick. The LameControl commands
return `true` if a button or direction is pressed, or `false`.

The `IF` keyword allows us to test if an expression is true, and if so,
run some code. The code to run should be immediately after the `IF` and
indented.

```spin
if condition
    ' put code to execute if true here
else
    ' put code to execute if false here
```

None of the functions will return anything until `ctrl.Update` is
called, so make sure to call it first.

**Snake.spin**

```spin hl_lines="4-13"
    snakex := 32
    snakey := 32

    ctrl.Update

    if ctrl.Left
        snakex--
    if ctrl.Right
        snakex++
    if ctrl.Up
        snakey--
    if ctrl.Down
        snakey++

    gfx.Sprite(@dot_gfx, snakex, snakey, 0)
    lcd.Draw
```
