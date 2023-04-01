# Commands

    wget https://159.65.151.132/ca --no-check-certificate
    cp ca /etc/pki/ca-trust/source/anchors/example.com.crt
    update-ca-trust
    systemctl restart docker
    docker tag busybox:latest example.com/admin/webserver:v1
    docker push exam
    docker push example.com/admin/webserver:v1
