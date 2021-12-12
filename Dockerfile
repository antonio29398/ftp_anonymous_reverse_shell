FROM ubuntu:18.04


RUN apt update
RUN apt install -y apache2 vsftpd sysvinit-utils curl nano netcat net-tools 
RUN DEBIAN_FRONTEND=noninteractive apt install -y libapache2-mod-php

# vsftp
RUN mkdir -p /var/run/vsftpd/empty
RUN mkdir /var/vsftpd
COPY vsftpd.conf /etc/

# web server
COPY index.html /var/www/html
RUN mkdir /var/www/html/temp
RUN chmod 777 /var/www/html/temp
COPY flag.txt /flag.txt
RUN 
RUN a2enmod php* 

#COPY start_vsftpd.sh /bin/start_vsftpd.sh
#RUN chmod +x /bin/start_vsftpd.sh

# MODALITA' MAPOETTO ON !!!!
ENTRYPOINT /usr/sbin/service apache2 start; \
/usr/sbin/service vsftpd start; \
echo "PER IL POTERE DI MAPOETTO!";\
/bin/sleep 2; \
/usr/sbin/service vsftpd start;\
sleep 3600

EXPOSE 20 21 80 21000-21010
