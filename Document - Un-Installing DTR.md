# Installing DTR:

    docker run -it --rm docker/dtr install --ucp-node node01 --ucp-username admin --ucp-url https://159.89.168.70 --ucp-insecure-tls

# Uninstalling DTR:

    docker run -it --rm docker/dtr:2.6.3 destroy --ucp-insecure-tls

# Blog to remove DTR entry from UCP:

    https://success.docker.com/article/extra-dtr-listed-in-ucp-31x-requiring-removal

# TLS Output:

    INFO[0006] Generated TLS certificate. dnsNames="[*.com *.*.com example.com *.dtr *.*.dtr]" domains="[*.com *.*.com 172.17.0.1 example.com *.dtr *.*.dtr]" ipAddresses="[172.17.0.1]"
