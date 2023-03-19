# Create a Service by Publishing port

    docker service create --name mywebserver --replicas 1 --publish 8080:80 nginx

# Verify Ports in Linux Server

    netstat -ntlp

# Verify IP address

    ifconfig eth0
    curl Request to IP on port 8080
    curl 142.93.214.57:8080
