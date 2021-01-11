# README
During this stage of the interview we want to evaluate your problem solving skills as well as you Ruby and Rails

* Read the sections below and take a glance at the data model
* Make sure you can run the applications and test suite of this project. (PostgreSQL is required)

You shouldn't need to spend more than 15-20 minutes to prepare for the interview.

## Overview
The rough plan is to build a RESTful API that allows our clinical team to assign homework to our members as needed. The API will use the data model described bellow.

We'll spend the first few minutes of the interview answering any questions you might have about the data model. After that we are going to go over the specific requirements and then start implementing the API.

Be prepared to account for some additional requirements that we'll introduce during the interview.

## The Data Model
At Brightline we assign homework to our `Member`s in the form of `ExerciseAssignment`s. Some important things that you should:

* Each `ExerciseAssignment` is assigned to a `Member`
* An `ExerciseAssignment` references an `Exercise`
* An `Exercise` encodes common information of the homework that we assign - for example the URL of the handout / video / ...
* A member can complete the same `Exercise` multiple times
* An `ExerciseAssignment` can be completed by setting the `completed_at` date
* We define `Exercise`s in a YAML file
