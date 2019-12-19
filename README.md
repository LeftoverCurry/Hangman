# Hangman

A vanilla Ruby console-based Hangman game using Rspec for testing. I've split it out into an architecture more reminicent of an MVC framework for better separation of concerns. It currently has a display, full logic, and the ability to save and recall game states based on the user's name.  Possible additions could include logic to allow previous users to play a new game instead of their saved game, the ability to save multiple games per user, and more comprehensive integration tests.

Challenges with this application development include the inability to properly mock up console based user input in the event of recursion, which led to a few interesting code design choices to allow for automated test flow.
