# docker-compose.yml

    version: '3'
    services:
      webserver:
        image: nginx
        ports:
           - "8080:80"
      database:
        image: redis
        
# Deploy Stack:

    docker stack deploy --compose-file docker-compose.yml mydemo

# Remove Stack

    docker stack rm mydemo
