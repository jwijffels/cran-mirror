# bnosac/concerto #

Docker setup for [Concerto](https://code.google.com/p/concerto-platform/). 
Concerto stands for "Computerized Adaptive Testing platform which combines R statistical engine with HTML presentation capabilities."

The bnosac/concerto docker application runs Concerto version 4.0.

Get the docker file
------------------------------

    sudo docker pull bnosac/concerto
    

Run concerto
------------------------------

    sudo docker run --tty=true --detach=true -p 80:80 -p 8787:8787 bnosac/concerto

Look for your running container and see which ip it is running at

    sudo docker ps 
    sudo docker inspect 5974969072fb
    
go to http://172.17.0.4/concerto/setup to setup Concerto
go to http://172.17.0.4/concerto to see Concerto
go to http://172.17.0.4/concerto/cms/ and login with user 'admin' and password 'admin'

go to 172.17.0.4:8787 and login with user rstudio and password rstudio if you want to access RStudio


Access the shell 
------------------------------------------------------------

    sudo docker run --interactive=true --rm=true --tty=true bnosac/concerto /bin/bash
