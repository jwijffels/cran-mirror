bnosac/cran-mirror
=================

Docker setup for hosting a CRAN mirror as explained at [http://cran.r-project.org/mirror-howto.html](http://cran.r-project.org/mirror-howto.html). 

Features
------------------------------

The OS is Ubuntu 14.04. The docker image uses an Apache webserver and allows SSH.

The docker image synchs with the CRAN mirror cran.r-project.org on 2 timepoints
* At the start of the application
* Dayly at 02h30 UTC

The location of the CRAN mirror is synched to **/var/www/html**.

Mark that the CRAN mirror is more than 100Gb so depending on your network, it will take some time to synch for the first time the complete CRAN host.

Get the docker file
------------------------------

    docker pull bnosac/cran-mirror

Example usage
------------------------------

Point the location of the CRAN mirror in the docker instance (/var/www/html) to a local directory on your computer (e.g. /home/bnosac/CRAN)

    docker run -p 22:22 -p 80:80 -v /home/bnosac/CRAN/:/var/www/html -d bnosac/cran-mirror

That's it! It started synching CRAN on /home/bnosac/CRAN and will synch every day at 02h30 UTC.

go to 0.0.0.0 in your browser or find the ip address where it is running and go to that address in your browser

    docker ps
    docker inspect --format '{{ .NetworkSettings.IPAddress }}' <your container ID>

You can now use your local repository to install R packages

    R
    install.packages('data.table', repos = "0.0.0.0")


Editing
------------------------------------------------------------

You can ssh to a running machine using ssh. Login with user docker and password docker
    ssh docker@0.0.0.0 

To run commands or edit settings inside the container run 
    docker run -v /home/bnosac/CRAN/:/var/www/html -ti bnosac/cran-mirror /bin/bash

