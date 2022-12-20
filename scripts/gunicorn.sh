#!/bin/bash

source env/bin/activate

cd /var/jenkins_home/workspace/django_ci_cd-Project/app

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic -- no-input

echo "Migrations done"

cd /var/jenkins_home/workspace/django_ci_cd-Project/

cp -rf gunicorn.socket /etc/systemd/system/
cp -rf gunicorn.service /etc/systemd/system/

echo "Copied socket and service files..!"

echo "$USER"
echo "$PWD"



systemctl daemon-reload
systemctl start gunicorn

echo "Gunicorn has started."

systemctl enable gunicorn

echo "Gunicorn has been enabled."

systemctl restart gunicorn


systemctl status gunicorn

