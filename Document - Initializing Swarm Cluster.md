
# Initialize the Swam Manager [Run this from swam01 server]

    ifconfig eth0
    docker swarm init --advertise-addr 142.93.214.57

# Verify the Node status

    docker node ls
