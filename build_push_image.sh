# set variabel username github
read -p "input your github username: " USERNAME 

# set variabel password github
read -p "input your github personal access token: " token 

# build image berdasar dockerfile
echo "building image --\n" 
docker build -t item-app:v1 . 

# listing docker image
echo "-------->\n\nshow docker image list\n"
docker image ls

# re-tag image
echo "-------->\n\nchange image name\n"
docker tag item-app:v1 ghcr.io/$USERNAME/a433-microservices/item-app:v1

# lakukan login ke github container registry
echo "-------->\n\ngithub registry login\n"
echo $token | docker login ghcr.io -u $USERNAME --password-stdin

# push image yang sudah di re-tag ke ghcr
echo "-------->\n\npush image\n"
docker push ghcr.io/$USERNAME/a433-microservices/item-app:v1