# Create Docker Service
    docker service create --name webserver --replicas 1 nginx

# Scaling Up Operation
    docker service scale webserver=5

# Scaling Down Operation
    docker service scale webserver=1

# Verify Service Details:
    docker service ps webserver

# Remove Service After Practical:
    docker service rm webserver
