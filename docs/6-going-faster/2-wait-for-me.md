# Step 2: Wait for me!

We can make the game more playable by setting the frame rate. That's
when we intentionally limit the speed of the game so that it runs at a
more consistent speed instead of as fast as it feels like at the moment
(a nice thing to have!).

LameLCD has a command just for this: `lcd.SetFrameLimit`. It comes in
three speeds.

- `FULLSPEED` (\~35 frames/second): Like you're watching TV!

- `HALFSPEED` (\~18 frames/second): Starting to look choppy.

- `QUARTERSPEED` (\~9 frames/second): Pretty freaking slow.

You can try different values to see how they look; which one you use
really depends on your game.

I'm going to go with `HALFSPEED`. You can call it whenever you like to
change the frame rate, but I like to set it once at the beginning to
keep it simple.

**Snake.spin**

```spin hl_lines="3"
PUB Main
    lcd.Start(gfx.Start)
    lcd.SetFrameLimit (lcd#HALFSPEED)
    ctrl.Start
```
