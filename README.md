# README

## Goal

This goal of this interview is to learn more about what it would be like to work together, especially:

- How you break down complex problems
- Your knowledge of web applications in general and Ruby on Rails in particular
- What it's like to pair program with you for a couple hours, which is something we do relatively often as a team

## How to prepare

- Read the sections below and take a glance at the data model
- Make sure you can run the applications and test suite of this project (PostgreSQL is required)

If you have worked with Ruby on Rails recently, you shouldn't need to spend more than 15-20 minutes to prepare for the interview.

## Running the project

1. Make sure PostgreSQL is installed on your machine
   - See `config/database.yml` for the default values and override if needed
2. Run `bundle install` to install gem dependencies
3. Run `rails db:setup` to create the dev/test databases and load the schema
4. Run `rails server`
5. Visit `localhost:3000` and ensure that you see the "You're on Rails!" page

## Overview

We'll spend the first few minutes of the interview answering any questions you might have about the data model. After that we are going to go over the specific requirements for the interview problem. Be ready to alter or extend the data model below.

## The data model

At Brightline we assign homework to a `Member` in the form of an `ExerciseAssignment`. Some important things that you should know:

- Each `ExerciseAssignment` is assigned to a `Member`
- An `ExerciseAssignment` references an `Exercise`
- An `Exercise` encodes common information of the homework that we assign - for example the URL of the handout / video / ...
- A member can complete the same `Exercise` multiple times
- An `ExerciseAssignment` can be completed by setting the `completed_at` date
- We define `Exercise`s in a YAML file

## How do Exercises work?

We've omitted some lower-level details of Exercises that don't really apply to this scenario,
such as a detailed UI. You can assume that ExerciseAssignments generally work as follows:

1. A member logs into their account and sees a list of active assignments
2. They select an assignment and are presented with a multi-step UI for completing it
3. They fill out several fields and submit the assignment
4. A Rails controller populates the `completed_at` and `data` columns for the relevant ExerciseAssignment

As a specific example, here's how "Learning to Relax" might work:

1. "Before we start - how are you feeling?" (slider from 1-10 where 1 = very stressed, 10 = very relaxed)
2. Member completes a guided meditation exercise presented via video
3. "How are you feeling now?" (slider from 1-10 again)

Then the backend would persist `starting_feeling` and `ending_feeling` in the JSONB `data`
column on ExerciseAssignment.

Each exercise may collect unique data points, which is why it uses an unstructured JSONB column.
