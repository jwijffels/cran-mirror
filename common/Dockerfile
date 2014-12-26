## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM ubuntu:14.04

## This handle reaches Carl and Dirk
MAINTAINER "Jan Wijffels" jwijffels@bnosac.be

# Install.
RUN \
  cd ~ && \
  apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get install -y r-base wget curl software-properties-common libapparmor1 psmisc libssl0.9.8 libc6 && \
  wget http://download2.rstudio.org/rstudio-server-0.98.978-amd64.deb && \
  dpkg -i rstudio-server-0.98.978-amd64.deb

EXPOSE 8787

# Define default command.
CMD rstudio-server restart && /bin/bash
