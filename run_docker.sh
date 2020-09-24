#build docker images 
docker build -t mohamed/node-web-app .

#Run the image 
docker run -p 49160:8080 -d mohamed/node-web-app

#list all containers 
docker ps 