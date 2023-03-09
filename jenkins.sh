#!/bin/bash
#!/bin/bash
if [[ $GIT_BRANCH == origin/dev ]]
then
echo "this is dev branch"
#chmod +x deploy.sh
#sh deploy.sh
elif [[ $GIT_BRANCH == origin/jeevi ]]
then
echo "this is jeevi branch"
else
echo "give the correct branch"
fi
