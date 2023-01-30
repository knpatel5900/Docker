# Install Docker Engine on CentOS
To get started with Docker Engine on CentOS, make sure you meet the prerequisites, then install Docker.

## Prerequisites
OS requirements
To install Docker Engine, you need a maintained version of one of the following CentOS versions:
1. CentOS 7
2. CentOS 8 (stream)
3. CentOS 9 (stream)
Archived versions aren’t supported or tested.

## Uninstall old versions
1. Older versions of Docker went by the names of docker or docker-engine. Uninstall any such older versions before attempting to install a new version, along with associated dependencies:

 sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
                  
## Images, containers, volumes, and networks stored in /var/lib/docker/ aren’t automatically removed when you uninstall Docker.
It’s OK if yum reports that none of these packages are installed.

<sub> Images, containers, volumes, and networks stored in /var/lib/docker/ aren’t automatically removed when you uninstall Docker.

Installation methods
You can install Docker Engine in different ways, depending on your needs:

You can set up Docker’s repositories and install from them, for ease of installation and upgrade tasks. This is the recommended approach.

You can download the RPM package and install it manually and manage upgrades completely manually. This is useful in situations such as installing Docker on air-gapped systems with no access to the internet.

In testing and development environments, you can use automated convenience scripts to install Docker.

Install using the repository
Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository. </sub>



