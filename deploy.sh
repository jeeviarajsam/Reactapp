#!/bin/bash
#deploy the application
ls -l
mv -rf * react_app
tar -cvzf react_app.tar.gz react_app
scp -o StrictHostKeyChecking=no -i $key react_app.tar.gz ubuntu@$ip:/home/ubuntu
ssh -T -o StrictHostKeyChecking=no -i $key ubuntu@$ip<<EOF
cd /home/ubuntu
rm -rf react_app || true
tar -xvzf react_app.tar.gz 
cd reactapp
sudo +x docker.sh
./docker.sh

