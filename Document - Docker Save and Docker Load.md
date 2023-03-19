# Base Dockerfile

    FROM busybox
    RUN touch custom.txt
    CMD ["/bin/sh"]
    docker build -t myapp .

# Save and Load Images

    docker save myapp > myapp.tar
    docker load < myapp.tar
