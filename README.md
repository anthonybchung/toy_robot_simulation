# Toy Robot Simulation

## Aim

Use this exercise to refine my TDD(Test Driven Development) and Design Patterns in Object-Oriented Design.

## Breakdown the exercise.

Let's first look at the instructions that will be handed to the system.

Example

| Instructions   |
| :------------- |
| PLACE 1,2,EAST |
| MOVE           |
| RIGHT          |
| LEFT           |
| REPORT         |

## class Robot
Will store the current position of the robot.


## class Table
Will validate if the position entered is still on the table.

## class Controller
Takes in an array. Takes the first element of the array and controls the robot or return a position of the robot.
MOVE,RIGHT,LEFT and REPORT will only work if the robot has a position.

## class Interpretor.
Take in a file and read it line by line.
At each line will be converted into an array and feed into the controller.
