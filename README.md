# Install Docker Engine on CentOS
To get started with Docker Engine on CentOS, make sure you meet the prerequisites, then install Docker.

![Set Up Docker in CentOS]([https://raw.githubusercontent.com/miztiik/setup-aws-code-commit/master/images/SSH%20Connections%20to%20AWS%20CodeCommit%20Repositories.png](https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.globenewswire.com%2Fen%2Fnews-release%2F2022%2F03%2F31%2F2414082%2F0%2Fen%2FDocker-Raises-105-Million-to-Accelerate-Investments-in-Developer-Productivity-Trusted-Content-and-Ecosystem-Partnerships.html&psig=AOvVaw1f_7_KWKcVNrtnylfsnzqD&ust=1675145090454000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCOjJr_PP7vwCFQAAAAAdAAAAABAD))


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
Images, containers, volumes, and networks stored in /var/lib/docker/ aren’t automatically removed when you uninstall Docker.
Installation methods
You can install Docker Engine in different ways, depending on your needs:
You can set up Docker’s repositories and install from them, for ease of installation and upgrade tasks. This is the recommended approach.
You can download the RPM package and install it manually and manage upgrades completely manually. This is useful in situations such as installing Docker on air-gapped systems with no access to the internet.
In testing and development environments, you can use automated convenience scripts to install Docker.
  
##Install using the repository
Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository. </sub>
  
  
## Set up the repository

Install the yum-utils package (which provides the yum-config-manager utility) and set up the repository.

        sudo yum install -y yum-utils
        sudo yum-config-manager \
                        --add-repo https://download.docker.com/linux/centos/docker-ce.repo
                        

To install the latest version, run:

        sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
        
If prompted to accept the GPG key, verify that the fingerprint matches 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35, and if so, accept it.
This command installs Docker, but it doesn’t start Docker. It also creates a docker group, however, it doesn’t add any users to the group by default.

## Install using the convenience script

Docker provides a convenience script at https://get.docker.com/ to install Docker into development environments non-interactively. The convenience script isn’t recommended for production environments, but it’s useful for creating a provisioning script tailored to your needs. Also refer to the install using the repository steps to learn about installation steps to install using the package repository. The source code for the script is open source, and can be found in the docker-install repository on GitHub.
Always examine scripts downloaded from the internet before running them locally. Before installing, make yourself familiar with potential risks and limitations of the convenience script:

The script requires root or sudo privileges to run.
The script attempts to detect your Linux distribution and version and configure your package management system for you.
The script doesn’t allow you to customize most installation parameters.
The script installs dependencies and recommendations without asking for confirmation. This may install a large number of packages, depending on the current configuration of your host machine.
By default, the script installs the latest stable release of Docker, containerd, and runc. When using this script to provision a machine, this may result in unexpected major version upgrades of Docker. Always test upgrades in a test environment before deploying to your production systems.
The script isn’t designed to upgrade an existing Docker installation. When using the script to update an existing installation, dependencies may not be updated to the expected version, resulting in outdated versions.
Tip: preview script steps before running

        curl -fsSL https://get.docker.com -o get-docker.sh
        sudo sh ./get-docker.sh --dry-run
        
 **This example downloads the script from https://get.docker.com/ and runs it to install the latest stable release of Docker on Linux:**

         curl -fsSL https://get.docker.com -o get-docker.sh
         sudo sh get-docker.sh

## Install pre-releases
Docker also provides a convenience script at https://test.docker.com/ to install pre-releases of Docker on Linux. This script is equal to the script at get.docker.com, but configures your package manager to use the test channel of the Docker package repository. The test channel includes both stable and pre-releases (beta versions, release-candidates) of Docker. Use this script to get early access to new releases, and to evaluate them in a testing environment before they’re released as stable.

**To install the latest version of Docker on Linux from the test channel, run:**

         curl -fsSL https://test.docker.com -o test-docker.sh
         sudo sh test-docker.sh
 
## Start Docker Service

        sudo systemctl start docker
        
Verify that Docker Engine installation is successful by running the hello-world image.

## Enable Docker Service

         sudo systemctl enable docker

## Stop Docker Service

         sudo systemctl enable docker
         
## Uninstall Docker Engine
Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages: 

        sudo yum remove docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-ce-rootless-extras
        
Images, containers, volumes, or customized configuration files on your host are not automatically removed. To delete all images, containers, and volumes:

        sudo rm -rf /var/lib/docker
        sudo rm -rf /var/lib/containerd
        
You must delete any edited configuration files manually.
        
