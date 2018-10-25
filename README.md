# Assignment 3



For this assignment you are provided with an app that creates a stream of particles (yellow circles) on touch events and these particles fall under the influence of gravity. You are to extend this example so that 

* particles bounce off the bottom and sides of the screen
    * this will require finding a way to pass information on the view bounds from the controller to the particle objects when they update their position
* particles are removed after a period of time
    * this will require adding an attribute to the particle object that tracks how long the particle has been alive and finding the right point in time to remove old particles
* particles receive an initial velocity that comes from the movement of the touch event
    *  this will involve computing the difference between consecutive touch positions and using this as the initial particle velocity
* give particles a tail (possibly like a rain drop) related to their velocity
    * this will involve using the particle velocity to calculate a tail point and drawing a shape for the tail using this point


## Extra Ideas

* add a damping force to the bounce


## Steps

1. Fork this project to create your own GitLab repository for this assignment (see "Using GitLab" topic).
2. Clone your copy of this repository to your local development environment. The repository will consist of only this README file.
3. Extend the project as described above. 
4. Using the iOS simulator run the project. 
5. Use the QuickTime Player app to make a screen recording of the running app. Save this screen recording movie to the base folder of this project. 
6. Add the movie to git with "git add movie-name".
7. Clean the project with Xcode > Product > Clean.
8. Commit the changes with "git commit -m "some commit message".
9. Push your repository back with gitlab with "git push -u origin master".
10. Using the GitLab interface add me as a "reporter" member of your repository. 
11. Finally, create an issue, assigned to me, on your repository indicating that it is ready for grading. In the issue please include a note about anything extra you have included in the app.
