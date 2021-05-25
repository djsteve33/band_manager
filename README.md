# Band Manager

# Description

With this application, the manager of a band can schedule and view upcoming concerts for their band. A concert can be created through the add a concert form. When creating the concert, the band manger will select a venue, the band’s name, the date of the concert, and the time of the concert. If a venue does not exist yet, you can also create a venue while creating the concert. If a venue does exist, you can simply select it from the selection menu. 
During the concert creation process, if the venue already exists, the band manager will not need to fill in the venue fields. The venue fields include the city and state of the venue as well as its capacity.
The band manager can also view all the concerts they have scheduled and all of the venues that the concerts are scheduled at. 
If the band manager leaves a required field blank, they will receive an error. They will also get an error if they try to schedule multiple concerts for the same date and time at the same venue.

# Installation

In order to run the application, you will first need to launch the Rails server by typing rails s in your IDE/WSL. Then you want to go to http://localhost:3000/ in your browser.

# Usage

When the program loads up in your browser, you will see the options of Sign Up, Log In, and Log In with Google. If you haven’t signed up yet, you will need to do that first. If you have signed up, you can click on either Log In or Log In with Google. Once you’re logged in, you can Add A Concert, Add a Venue, see All Concerts, see All Venues, and logout.

# Acknowledgements

I would like to thank my Flatiron Cohort leader, Charlotte Neff, for her contributions to my project.

# License

I am licensed through an MIT License: https://github.com/djsteve33/band_manager/blob/master/LICENSE. 
