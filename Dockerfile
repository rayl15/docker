# This image is based on CentOS 7 and will start apache service in each container
FROM centos:latest
MAINTAINER rahul.sharma@sourcefuse.com

RUN yum update -y
RUN yum install -y httpd net-tools

RUN echo "This is a custom index file built during the image creation: " > /var/www/html/index.html

# Expose Permanently
EXPOSE 80

ENTRYPOINT apachectl "-DFOREGROUND"
