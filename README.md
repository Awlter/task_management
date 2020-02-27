# README
## Prepare
This project is a tool for users to manage their tasks. I don't assume this for people to collaborate with each other. So my solution is simply to implement that a user has many tasks. A user has the information to log in the system and access their own tasks, but not able to others'. I assume the most important state on a task would be priority indicators; I can see taskes may be sorted based on the field, so I decide to use an array of integers to represent the ones having been chosen. When sorting, you can sort based on the sum value, e.g: Urgent is 10, important is 5, which makes a task with priorities of [10, 5]

## Run
- docker is needed
- docker-compose build (it might take a while)
- docker-compose up
- docker-compose run web rake db:create (in another tab)
- docker-compose run web rake db:migrate
- open http://localhost:3007/
