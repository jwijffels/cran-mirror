# bnosac/R-common #

Docker setup for commonly used R development.

## Get the docker file
sudo docker login --email="jwijffels@bnosac.be" --password="XXXXXXXXX" --username="jwijffels" https://index.docker.io/v1/
sudo docker pull jwijffels/r-common

## Example usage
sudo docker run --detach=true -p 8787:8787 jwijffels/r-common
sudo docker ps
sudo docker inspect 5974969072fb
go to 172.17.0.4:8787 and login with user rstudio and password rstudio

## Example usage with your own user
sudo docker run --detach=true -p 8787:8787 -e USER=jwijffels -e PASSWORD=test jwijffels/r-common
sudo docker ps
sudo docker inspect 5974969072fb
go to 172.17.0.4:8787 and login with user jwijffels and password test

## Access the shell 
sudo docker run --interactive=true --rm=true --tty=true jwijffels/r-common /bin/bash
