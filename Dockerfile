From centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
Run yum install httpd zip unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page291/gravita.zip /var/www/html
WORKDIR /var/www/html
RUN unzip gravita.zip
RUN rm -rf gravita.zip &&\
    cp -rf gravita.zip/* . &&\
    rm -rf gravita.zip 
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
