# Step 2: Correct The Dots

If you want it elsewhere, you have to set it to equal another point
using `:=`. The LameStation screen is 128x64 pixels, so let's set it to
(32,32).

**Snake.spin**

```spin hl_lines="5-6"
PUB Main
    lcd.Start(gfx.Start)
    ctrl.Start

    snakex := 32
    snakey := 32

    gfx.Sprite(@dot_gfx, snakex, snakey, 0)
```

That puts the dot squarely in the center. Cool, but sitting in one place
is boring. So let's move it around!
