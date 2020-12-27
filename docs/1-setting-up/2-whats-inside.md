# Step 2: What's Inside?

This template adds some basic code to get a LameStation game started.
Let's look at what's inside:

- The `CON` block contains code to tell the LameStation to run at full
  speed.

  ```spin
  CON
      _clkmode = xtal1 + pll16x
      _xinfreq = 5_000_000
  ```

  !!! important "Do not modify `_clkmode` and `_xinfreq`"
  These are hardware-dependent and shouldn’t be changed unless you know
  what you’re doing.

- The `OBJ` block adds three libraries needed for this project:
  LameGFX and LameLCD for graphics, and LameControl for user input.

  ```spin
  OBJ
      lcd  : "LameLCD"
      gfx  : "LameGFX"
      ctrl : "LameControl"
  ```

- The `PUB Main` block starts the libraries.

  ```spin
  PUB Main
      lcd.Start(gfx.Start)
      ctrl.Start

      ' add your code here
  ```

  !!! tip

      The first function in your file is where your code will start when
      run. It doesn't have to be called `Main`, but it does have to be
      first.

You will find this code used a lot in almost every game, which is why
we're using a template to create it.

**NEXT TIME: You will see the snake finally come to life... as a dot.**
