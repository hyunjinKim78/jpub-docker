from ubuntu
maintainer "jini <jini@secui.com>"
label "purpose"="container web application practice."
run apt-get update && apt-get -y install apache2

run echo 'Docker Container Application.' > /var/www/html/index.html

run mkdir /webapp

run echo './etc/appache2/envvars' > /webapp/run_http.sh && \
run echo 'mkdir -p /var/run/appache2' >> /webapp/run_http.sh && \
run echo 'mkdir -p /var/lock/appache2' >> /webapp/run_http.sh && \
run echo '/usr/sbin/appache2 -D FOREGROUND' >> /webapp/run_http.sh && \
chmod 744 /webapp/run_http.sh

EXPOSE 80

CMD /webapp/run_http.sh
