From centos:latest
Run yum install httpd zip unzip vim -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page291/gravita.zip /var/www/html
WORKDIR /var/www/html
RUN unzip gravita.zip
RUN rm -rf gravita.zip &&\
    cp -rf gravita/* . &&\
    rm -rf gravita.zip &&\
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
