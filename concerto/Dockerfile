FROM bnosac:r-common

MAINTAINER "Jan Wijffels" jwijffels@bnosac.be

#RUN add-apt-repository -y ppa:eugenesan/ppa
#RUN apt-get update
#RUN apt-get install php5

ENV DEBIAN-FRONTEND noninteractive
RUN export DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y mysql-server mysql-client mysql-common
RUN apt-get install -y apache2 php5 libapache2-mod-php5 php5-mysql libmysqlclient-dev

## Set up stupid pwd 
RUN echo 'root:abc123' | chpasswd

## Follow the installation steps of Concerto regarding php settings
RUN sed -ri 's/^short_open_tag\s*=\s*Off/short_open_tag = On/g' /etc/php5/apache2/php.ini
RUN sed -ri 's/^short_open_tag\s*=\s*Off/short_open_tag = On/g' /etc/php5/cli/php.ini

## Get concerto
RUN wget https://concerto-platform.googlecode.com/files/concerto_platform_v4.0.0.beta8.zip
RUN mkdir /var/www/concerto
RUN unzip concerto_platform_v4.0.0.beta8.zip -d /var/www/concerto
RUN wget http://cran.r-project.org/src/contrib/Archive/rjson/rjson_0.2.13.tar.gz
## Install the concerto R package
RUN R CMD INSTALL rjson_0.2.13.tar.gz --library=/usr/lib/R/library
RUN R CMD build /var/www/concerto/lib/R/concerto
RUN R -e "install.packages(c('session', 'RMySQL'), lib = '/usr/lib/R/library')"
RUN R CMD INSTALL concerto_0.3.3.tar.gz --library=/usr/lib/R/library
## Set up the concerto database
RUN /etc/init.d/mysql start
RUN mysql -u root --password=abc123 -e "create database db_master_name"; 
RUN mysql -u root --password=abc123 -e "GRANT ALL PRIVILEGES ON *.* TO 'db_master_user'@'%' IDENTIFIED BY 'db_password' WITH GRANT OPTION;"

## Expose the port
EXPOSE 80



