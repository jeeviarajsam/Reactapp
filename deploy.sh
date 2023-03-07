#!/bin/bash
#deploy the application
ls -l
mkdir react_app && mv -f * react_app
tar -cvzf react_app.tar.gz react_app
scp -o StrictHostKeyChecking=no -i $key react_app.tar.gz ubuntu@18.183.89.72:/home/ubuntu
ssh -T -o StrictHostKeyChecking=no -i $key ubuntu@18.183.89.72<<EOF
cd /home/ubuntu
rm -rf react_app || true
tar -xvzf react_app.tar.gz 
cd react_app
chmod +x docker.sh
./docker.sh

