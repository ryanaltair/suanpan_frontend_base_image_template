image=$(cat imagename)
version=$(cat version)
docker run -it --rm -p 7000:7000 $image:$version node /home/app/server.js