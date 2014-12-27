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
  libc6 \
  sudo \
  file \
  ca-certificates \
  git \
  psmisc \
  libcurl4-openssl-dev \
  software-properties-common \
  libapparmor1 \
  libssl0.9.8 \
  supervisor \
  r-base \
  r-base-dev \
  r-recommended \
  && wget http://download2.rstudio.org/rstudio-server-0.98.978-amd64.deb \
  && dpkg -i rstudio-server-0.98.978-amd64.deb \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
  && rm rstudio-server-*-amd64.deb 

## Set CRAN repository
RUN echo 'options(repos = list(CRAN = "http://cran.at.r-project.org"))' >> /etc/R/Rprofile.site

## Run supervisord (https://docs.docker.com/articles/using_supervisord/) which runs the rstudio server on port 8787
RUN mkdir -p /var/log/supervisor
COPY userconf.sh /usr/bin/userconf.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 8787
CMD ["/usr/bin/supervisord"] 

## CMD ["R"]
## Run Rstudio
## CMD rstudio-server restart && /bin/bash



