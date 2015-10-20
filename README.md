## Fractals #125
by Drew Olson

When I learned about fractals in high school math class, I immediately found them fascinating. For those of you unfamiliar with the concept, the definition from Wikipedia is as follows: a fractal is "a rough or fragmented geometric shape that can be subdivided in parts, each of which is (at least approximately) a reduced-size copy of the whole".

At the end of the unit in which we were taught them, the fractal below was a test question. In subsequent years, I began drawing it freehand to higher and higher levels. The details and patterns that emerge are fascinating.

The goal is to create a ruby program which takes the level as an argument and then draws the fractal shown below to the specified level. The fractal is created by drawing the first level, then repeating the pattern such that each base piece is replaced with the fractal from the higher level. Thus, to move from level 1 to level 2, we replace each line with the shape at level 1. Notice that the position changes as well, meaning if the line is vertical we replace it with a vertically positioned shape of level 1 (right and left facing also matter). I have shown the first 3 levels below (including the base component at level 0). Feel free to use the console for output or get fancy with RMagick or something similar.

