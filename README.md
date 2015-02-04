Robotic SheepDog Coding Exercise
================================

Introduction
------------
>The task below is designed to give us an idea of how you would approach a problem as well as other aspects such as design, code quality, testing etc.
You can use any version of gems/libraries.

Problem
-------
>As part of a long­running war with her evil but irreplacable sheep­dog Duncan
over who would do the washing up, Fredwina the Farmer has locked herself in her shed and developed the first ever robotic sheep dog.

>She aims to make Duncan's job redundant and herself rich beyond measure.
In part one of her campaign, Fredwina is planning a "Shock and Awe showcase", where she plans to demonstrate the basic command­following awesomeness of her new babies, the robotic sheep­dogs.

>In order to do this, she needs your help in writing the navigation module.
A robotic sheep­dog's position and location is represented by a combination of x and y co­ordinates and a letter representing one of the four cardinal compass
points. Her paddock is divided up into a grid to simplify navigation. An
example position might be 0, 0, N, which means the sheep­dog is in the bottom
left corner and facing North.

>In order to control a sheep­dog, Fredwina sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the sheep­dog spin 90 degrees left or right respectively, without moving from its current spot.
'M' means move forward one grid point, and maintain the same heading.
Assume that the square directly North from (x, y) is (x, y+1).

Input
-----
>The first line of input is the upper­right coordinates of the paddock that the sheep­dog is in, the lower­left coordinates are assumed to be 0,0.
The rest of the input is information pertaining to the sheep­dogs that are going
to do the demonstration. Each sheep­dog has two lines of input. The first line gives the sheep­dog's position, and the second line is a series of instructions telling
the sheep­dog how to move around the paddock.

>The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co­ordinates and the sheep­dog's orientation.

>Sheep­dogs must not be permitted to bump into each other or run each other over: your program should detect this and fail appropriately.

Output
------
>The output for each sheep­dog should be its final co­ordinates and heading.

Example input/output
--------------------
Test Input:
-----------

> 5 5 <br/>
> 1 2 N <br/>
> LMLMLMLMM <br/>
> 3 3 E <br/>
> MMRMMRMRRM <br/>

Expected Output:
----------------
> 1 3 N <br/>
> 5 1 E