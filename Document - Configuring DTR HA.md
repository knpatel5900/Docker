# Join the DTR Replica

    docker run -it --rm docker/dtr join --ucp-insecure-tls

# Connect to Endpoints:

    curl -k https://142.93.213.134/_ping
    curl -ksl -u admin:88DBJTWmxMCL6J9KpfgpGBq5UvsMfxL1 https://142.93.213.134/api/v0/meta/cluster_status
