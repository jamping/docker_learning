#!/bin/sh
for image in `docker images |grep -v "REPOSITORY"|grep -v "<none>"|awk '{print $1":"$2}'`
do
	./push_images.sh $image
done