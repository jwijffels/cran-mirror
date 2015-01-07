bnosac/r-common
=================

Docker setup for commonly used R development. 
The OS is Ubuntu 14.04.
The docker application includes r-base, r-base-dev, r-recommended and sets up RStudio


Get the docker file
------------------------------

    sudo docker pull bnosac/r-common

Example usage
------------------------------

    sudo docker run --detach=true -p 8787:8787 bnosac/r-common
    sudo docker ps
    sudo docker inspect 5974969072fb

go to 172.17.0.4:8787 and login with user rstudio and password rstudio


Example usage with your own user
------------------------------------------------------------

    sudo docker run --detach=true -p 8787:8787 -e USER=jwijffels -e PASSWORD=test bnosac/r-common
    sudo docker ps
    sudo docker inspect 5974969072fb

go to 172.17.0.4:8787 and login with user jwijffels and password test

Access the shell 
------------------------------------------------------------

    sudo docker run --interactive=true --rm=true --tty=true bnosac/r-common /bin/bash
