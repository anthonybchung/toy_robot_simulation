# Toy Robot Simulation

## Aim

Use this exercise to refine my TDD(Test Driven Development) and Design Patterns in Object-Oriented Design.

## Breakdown the exercise.

At first glance we see there are two nouns/entities.

- Instruction
- Robot
- Table

While analysing further, we can create more classes that will take care of individual commands.

| Command(s)        | Class      | Description                                     |
| :---------------- | :--------- | :---------------------------------------------- |
| PLACE X,Y,F       | Crane      | it will handle the placing of the robot         |
| MOVE, LEFT, RIGHT | Controller | it will steer the robot around the aboard       |
| REPORT            | Report     | it will handle the position output of the Robot |

## Get deeper into the Classes

### Class: Instruction

It shouldbe able to accept different format of instructions.

### Class: Robot

It contains 3 attributes.

- x_pos
- y_pos
- face

This robot does nothing except for keeping track of its position.

### Class: Table

- return next position
- return the same position because of table limit
- return all robot's attributes as nil if the Crane places the robot out of bound.

### Class: Crane

It is reponsible to place the **_robot_** onto the **_table_**.

### Class: Controller

It controllers the robot.

### Class: Report

It outputs the final position of the robot.
