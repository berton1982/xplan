#!/bin/bash

# delete docker images
imageIds=$(docker images | sed -n '/k8s/p' | gawk '{print $3}')
for id in $imageIds
do
	docker rmi $id
done


# show undeleted images 
echo "show left images: docker images:"
docker images
