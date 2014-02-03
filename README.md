 ThoughtWorks Coding Challenge #3: Mars Rover
 ============================================
 
Solution by Ryan Burbank

Challenge Description: 

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.
 
A rover's position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.
 
In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot. 'M' means move forward one grid point, and maintain the same heading.
 
Assume that the square directly North from (x, y) is (x, y+1).
 
INPUT:
The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.
 
The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau.
 
The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation.
 
Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.
 
 
OUTPUT
The output for each rover should be its final co-ordinates and heading.
 
INPUT AND OUTPUT
 
Test Input:
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
 
Expected Output:
1 3 N
5 1 E
==========

##Application Setup and Execution
=================================
note: all commands should be run from top-level directory
Step 1: run bundle install from your command line
Step 2: bundle exec rspec will run the test suite
Step 3: ruby interface.rb will run the application with the first set of sample inputs
Step 4: ruby interface.rb <path_to_file_here> will run the application with the supplied file(.txt,.yml,.csv only) *note: files must be delimited by newline
Step 5: Each rover's final position will be outputted the console.

##Code Analysis:
================
interface.rb: requires all files in app/, then executes the program, using ARGV to take an optional
file_path parameter.

parser.rb: module capable of parsing .txt, .csv, and .yml files into a formatted array. Will raise
errors if file extention is not supported or if file is empty

mission.rb: includes parser module, as is capable of taking either a file_path string or array as an argument.  Once array_of_orders has been set.  Extracts plateau dimensions and orders for all rovers(including current x & y position, heading, and all remaining moves and stores them in instance variables.

plateau.rb: takes a hash with rows and columns keys as an argument when initialized.  

rover.rb: takes a hash with its current position, heading, and moves when intialized, as well as a plateau object from which it sets its boundaries.  In addition, it also takes an optional direction_hash which can be used to set its compass with different directions(
n, ne, e, s, se, etc..).

compass.rb: takes a hash of directions when initialized, and then creates an enumerator with cycle, in order to continually rotate directions.  #set_current_heading sets the compass's current_facing to match 
the rover's initial heading. 

lib/ : contains a variety of sample_input files in multiple formats(.yml, .csv, and .txt).  Also includes
2 .foo files and several empty files for use in tests

spec/ : contains spec_helper and 29 tests covering all classes used in the application.

Gemfile: contains 'rpsec' gem

correct_output.txt: contains the inputs and correct outputs for sample files



