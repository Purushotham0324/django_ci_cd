#!/bin/bash

cp -rf /var/jenkins_home/workspace/django_ci_cd-Project/scripts/app.conf /etc/nginx/sites-available/app
chmod 710  /var/jenkins_home/workspace/django_ci_cd-Project/app

ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled
nginx -t

systemctl start nginx
systemctl enable nginx

echo "Nginx has been started"

systemctl status nginx
