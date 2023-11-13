# Toy Robot Simulation

## Aim

Use this exercise to refine my TDD(Test Driven Development) and Design Patterns in Object-Oriented Design.

# Breakdown the exercise.

At first glance we see there are two nouns/entities.

- Robot
- Table

While analysing further, we can create more classes that will take care of individual commands.

| Command(s)        | Class      | Description                                     |
| :---------------- | :--------- | :---------------------------------------------- |
| PLACE X,Y,F       | Crane      | it will handle the placing of the robot         |
| MOVE, LEFT, RIGHT | Controller | it will steer the robot around the aboard       |
| REPORT            | Report     | it will handle the position output of the Robot |
