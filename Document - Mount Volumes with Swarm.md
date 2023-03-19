# Create Service with Volume

    docker service create --name myservice --mount type=volume,source=myvolume,target=/mypath nginx

# Verify the Host where service is created:

    docker service ps myservice

# Connect to Container and Verify Mount

    docker container exec -it [CONTAINER-ID] bash
    ls -l /
    cd /mypath
    create files
    get out of container
    Verify Volume Information
    cd /var/lib/docker/volumes/myvolume/_data
    ls
    
# you will find tha data create inside docker

    docker volume ls

# Remove Service

    docker service rm myservice
