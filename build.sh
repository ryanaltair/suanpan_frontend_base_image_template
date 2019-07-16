image=$(cat imagename)
version=$(cat version)
docker build -f ./Dockerfile -t $image:$version   .
docker tag   $image:$version  $image:latest
docker push   $image:$version 
docker push   $image:latest 

  