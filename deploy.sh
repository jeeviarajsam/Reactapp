#!/bin/bash
#deploy the application
if [ $BRANCH_NAME = "dev" ]
	then
		ls -l
		mkdir react_app && mv -f * react_app
		tar -cvzf react_app.tar.gz react_app
		scp -o StrictHostKeyChecking=no -i $key react_app.tar.gz ubuntu@3.112.2.162:/home/ubuntu
		ssh -T -o StrictHostKeyChecking=no -i $key ubuntu@3.112.2.162<<EOF
		cd /home/ubuntu
		rm -rf react_app || true
		tar -xvzf react_app.tar.gz 
		cd react_app
		chmod +x docker.sh
		./docker.sh
		docker login --username=$docker_username --password=$docker_password
	else
 		echo "this is master"
fi
#echo $docker_password | docker login -u $docker_username --password-stdin
#docker image push jeeviarajsam/reactapp_dev:v1
#docker run -d -it --name react_app -p 81:80 jeeviarajsam/reactapp_dev:v1
#
