#!/bin/bash
maintaner="dzleaf"
app="demo"
container=`docker ps -a -q --no-trunc --filter name=^/$app`
image=`docker images -q $maintaner/$app`
script_path=$(dirname $(realpath $0))

if [ -n "$container" ] || [ "$container" -eq "1" ] ; then
    docker rm -f "$container"
fi

if [ -n "$image" ] || [ "$image" -eq 1 ] ; then
    docker rmi "$image"
fi

"$script_path"/mvnw clean package

docker build -t "$maintaner"/"$app" "$script_path"
docker run -p 8888:8080 -d --name "$app" "$maintaner"/"$app"