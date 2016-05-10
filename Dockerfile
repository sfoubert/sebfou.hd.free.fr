#
# https://github.com/sfoubert
#

# Pull base image.
FROM ubuntu:latest
MAINTAINER Sebastien F "seb_fou@hotmail.com"

RUN \
  apt-get update && \
  apt-get -y install nginx

# Remove the default Nginx configuration file
#RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
#ADD nginx.conf /etc/nginx/
ADD sebfou.fr /etc/nginx/sites-enabled/
ADD . /home/pi/sebfou.hd.free.fr

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports.
EXPOSE 80
#EXPOSE 443

# Set the default command to execute
# when creating a new container
CMD service nginx start
