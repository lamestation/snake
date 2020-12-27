# Step 2: How much is too much?

Since the snake starts small and grows, we also need to keep track of
how many snake dots there are on the screen at any time. So we'll create
`snakecount`. Byte-sized is fine, since `MAX_LENGTH` is 256.

**Snake.spin**

```spin hl_lines="6"
VAR
    byte    snakex[MAX_LENGTH]
    byte    snakey[MAX_LENGTH]

    byte    snakedir
    byte    snakecount

PUB Main
    lcd.Start(gfx.Start)
```

Since we start with 1 pixel, we'll set `snakecount` to 1 at startup.

**Snake.spin**

```spin hl_lines="3"
    snakey[0] := 32
    snakedir := 1
    snakecount := 1

    repeat
        gfx.Clear
```

We're going to add a variable `i`. This one is just used for a `repeat`
loop.

**Snake.spin**

```spin hl_lines="4"
    byte    snakedir
    byte    snakecount

    byte    i

PUB Main
    lcd.Start(gfx.Start)
```
