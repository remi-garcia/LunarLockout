# Lunar Lockout
### The rules
Lunar Lockout is a single player puzzle game invented by Hiroshi Yamamoto in 1999 and refined by Nob Yoshigahara. The board for this game is a 5x5 grid on which robots can move. The goal is to move the Red robot (the one with a helmet) to the center. Robots can only move in four directions: Up, Left, Down and Right. Yet, once they start moving they cannot stop until being blocked by another robot. The borders of the board do not block robots: crossing a border is not allowed.

To play, select a starting position and try to find a solution.



### The solver - How to use it
The solver evaluates all the possible moves and, for each obtained position, repeats until a solution is found or no new moves can be made. The function that does this is called `find_solution()` and is available in [src/solver.jl](src/solver.jl). The file [src/boardrobots.jl](src/boardrobots.jl) contains functions that handle the moves.

Instances can be read using `read_board()`, the input of this function is a string and it outputs a board that can be used in `find_solution()`. The string corresponds to five lines with spaces for representing a empty spots and a number for a robot:
- `1` for the Red
- `2` for the Orange
- `3` for the Green
- `4` for the Purple
- `5` for the Yellow
- `6` for the Blue

The string
```Julia
"""    2
  3  
 4
    5
     1
"""
```

corresponds to

![first_problem_image](images/challenge1.png?raw=true)

which is the first challenge of Lunar Lockout!

### Instances to play with
Instances from one move to be solved to fourteen moves are available in the archive [generated_instances.tar.xz](generated_instances.tar.xz).


### Challenge 39
The challenge 39 is as follows:

![challenge39_image](images/challenge39.png?raw=true)

The solution proposed in the game needs 15 moves. The solver showed that there exists many solutions that only need 13 moves. An example is given below.

<details>
  <summary>Solution</summary>
  1:	Green - Right
  2:	Purple - Down
  3:	Red - Left
  4:	Orange - Down
  5:	Yellow - Down
  6:	Yellow - Right
  7:	Yellow - Up
  8:	Yellow - Left
  9:	Orange - Down
  10:	Orange - Right
  11:	Green - Down
  12:	Red - Up
  13:	Red - Right
</details>
