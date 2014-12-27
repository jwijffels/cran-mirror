FROM ubuntu:14.04

MAINTAINER "Jan Wijffels" jwijffels@bnosac.be

RUN cd ~
RUN apt-get update -qq && apt-get install -y --no-install-recommends wget locales 

## Set default locale
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen en_US.utf8 && /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

## Installation instructions at http://cran.r-project.org/bin/linux/ubuntu/ to obtain the latest R
RUN gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 \ 
&& gpg -a --export E084DAB9 | sudo apt-key add -
&& echo "deb http://cran.at.r-project.org/bin/linux/ubuntu trusty/" | tee -a /etc/apt/sources.list

# Install R
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  ca-certificates \
  file \
  git \
  libcurl4-openssl-dev \
  supervisor \
  sudo \
  software-properties-common \
  libapparmor1 \
  psmisc \
  libssl0.9.8 \
  libc6 \
  r-base \
  r-base-dev \
  r-recommended \
  && wget http://download2.rstudio.org/rstudio-server-0.98.978-amd64.deb \
  && dpkg -i rstudio-server-0.98.978-amd64.deb \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
  && rm rstudio-server-*-amd64.deb \

EXPOSE 8787

RUN echo 'options(repos = list(CRAN = "http://cran.at.r-project.org"))' >> /etc/R/Rprofile.site
CMD ["R"]

# Run Rstudio
# CMD rstudio-server restart && /bin/bash




