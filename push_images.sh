#!/bin/sh
# This script will upload the given local images to a registry server
# Usage: push_images image1 [image2...]
# Author yeasy@github
# Created: 2014.09-23

# The registry server address where you want push the images into
registry=127.0.0.1:5000

### Do not modify the following part, unless you know what it means ###
ech0_r() {
	[ $# -ne 1 ] && return 0
	echo -e "\033[31m$1\033[0m"
}

ech0_g() {
	[ $# -ne 1 ] && return 0
	echo -e "\033[32m$1\033[0m"
}

ech0_y() {
	[ $# -ne 1 ] && return 0
	echo -e "\033[33m$1\033[0m"
}

ech0_b() {
	[ $# -ne 1 ] && return 0
	echo -e "\033[34m$1\033[0m"
}

usage() {
	docker images
	echo "Usage: $0 registry1:tag1 [registry2:tag2...]"
}

[ $# -lt 1 ] && usage && exit

ech0_b "The registry server is $registry"

for image in "$@"
do
	ech0_b "Uploading $image..."
	docker tag $image $registry/$image
	docker push $registry/$image
	docker rmi $registry/$image
	ech0_g "Done"
done