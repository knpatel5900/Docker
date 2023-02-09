# Install Docker Engine on CentOS
To get started with Docker Engine on CentOS, make sure you meet the prerequisites, then install Docker.

![Set Up Docker in CentOS](https://ml.globenewswire.com/Resource/Download/c83c4886-b215-4cf0-a973-64b8f65e7003)

## Prerequisites
OS requirements
To install Docker Engine, you need a maintained version of one of the following CentOS versions:
1. CentOS 7
2. CentOS 8 (stream)
3. CentOS 9 (stream)
Archived versions aren’t supported or tested.

## Uninstall old versions
_Older versions of Docker went by the names of docker or docker-engine. Uninstall any such older versions before attempting to install a new version, along with associated dependencies:_

        sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine 

**Images, containers, volumes, and networks stored in /var/lib/docker/ aren’t automatically removed when you uninstall Docker**

_It"s OK if yum reports that none of these packages are installed._

**Images, containers, volumes, and networks stored in /var/lib/docker/ aren’t automatically removed when you uninstall Docker.**

**You can install Docker Engine in different ways, depending on your needs:**

_You can set up Docker’s repositories and install from them, for ease of installation and upgrade tasks. This is the recommended approach._
_You can download the RPM package and install it manually and manage upgrades completely manually. This is useful in situations such as installing Docker on air-gapped systems with no access to the internet._
_In testing and development environments, you can use automated convenience scripts to install Docker._
  
**Install using the repository**
_Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository._
  
  
## Set up the repository

Install the yum-utils package (which provides the yum-config-manager utility) and set up the repository.

        sudo yum install -y yum-utils
        sudo yum-config-manager \
                        --add-repo https://download.docker.com/linux/centos/docker-ce.repo
                        

To install the latest version, run:

        sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
        
_If prompted to accept the GPG key, verify that the fingerprint matches 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35, and if so, accept it.
This command installs Docker, but it doesn’t start Docker. It also creates a docker group, however, it doesn’t add any users to the group by default._

## Install using the convenience script

_Docker provides a convenience script at https://get.docker.com/ to install Docker into development environments non-interactively. The convenience script isn’t recommended for production environments, but it’s useful for creating a provisioning script tailored to your needs. Also refer to the install using the repository steps to learn about installation steps to install using the package repository. The source code for the script is open source, and can be found in the docker-install repository on GitHub._

_Always examine scripts downloaded from the internet before running them locally. Before installing, make yourself familiar with potential risks and limitations of the convenience script:_

_The script requires root or sudo privileges to run._

_The script attempts to detect your Linux distribution and version and configure your package management system for you. The script doesn’t allow you to customize most installation parameters._

_The script installs dependencies and recommendations without asking for confirmation. This may install a large number of packages, depending on the current configuration of your host machine._

_By default, the script installs the latest stable release of Docker, containerd, and runc. When using this script to provision a machine, this may result in unexpected major version upgrades of Docker. Always test upgrades in a test environment before deploying to your production systems.
The script isn’t designed to upgrade an existing Docker installation. When using the script to update an existing installation, dependencies may not be updated to the expected version, resulting in outdated versions._

**Tip: preview script steps before running**

        curl -fsSL https://get.docker.com -o get-docker.sh
        sudo sh ./get-docker.sh --dry-run
        
 **This example downloads the script from https://get.docker.com/ and runs it to install the latest stable release of Docker on Linux:**

         curl -fsSL https://get.docker.com -o get-docker.sh
         sudo sh get-docker.sh

## Install pre-releases
_Docker also provides a convenience script at https://test.docker.com/ to install pre-releases of Docker on Linux. This script is equal to the script at get.docker.com, but configures your package manager to use the test channel of the Docker package repository. The test channel includes both stable and pre-releases (beta versions, release-candidates) of Docker. Use this script to get early access to new releases, and to evaluate them in a testing environment before they’re released as stable._

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

# Docker Run

        docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

## Description
The docker run command first creates a writeable container layer over the specified image, and then starts it using the specified command. That is, docker run is equivalent to the API /containers/create then /containers/(id)/start. A stopped container can be restarted with all its previous changes intact using docker start. See docker ps -a to view a list of all containers.

## For information on connecting a container to a network, see the “Docker network overview”.
        
        --add-host		Add a custom host-to-IP mapping (host:ip)
        --attach , -a		Attach to STDIN, STDOUT or STDERR
        --blkio-weight		Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
        --blkio-weight-device		Block IO weight (relative device weight)
        --cap-add		Add Linux capabilities
        --cap-drop		Drop Linux capabilities
        --cgroup-parent		Optional parent cgroup for the container
        --cgroupns		API 1.41+
        Cgroup namespace to use (host|private) ‘host’: Run the container in the Docker host’s cgroup namespace ‘private’: Run the container in its own private cgroup namespace ‘’: Use the cgroup namespace as configured by the default-cgroupns-mode option on the daemon (default)
        --cidfile		Write the container ID to the file
        --cpu-count		CPU count (Windows only)
        --cpu-percent		CPU percent (Windows only)
        --cpu-period		Limit CPU CFS (Completely Fair Scheduler) period
        --cpu-quota		Limit CPU CFS (Completely Fair Scheduler) quota
        --cpu-rt-period		Limit CPU real-time period in microseconds
        --cpu-rt-runtime		Limit CPU real-time runtime in microseconds
        --cpu-shares , -c		CPU shares (relative weight)
        --cpus		Number of CPUs
        --cpuset-cpus		CPUs in which to allow execution (0-3, 0,1)
        --cpuset-mems		MEMs in which to allow execution (0-3, 0,1)
        --detach , -d		Run container in background and print container ID
        --detach-keys		Override the key sequence for detaching a container
        --device		Add a host device to the container
        --device-cgroup-rule		Add a rule to the cgroup allowed devices list
        --device-read-bps		Limit read rate (bytes per second) from a device
        --device-read-iops		Limit read rate (IO per second) from a device
        --device-write-bps		Limit write rate (bytes per second) to a device
        --device-write-iops		Limit write rate (IO per second) to a device
        --disable-content-trust	true	Skip image verification
        --dns		Set custom DNS servers
        --dns-opt		Set DNS options
        --dns-option		Set DNS options
        --dns-search		Set custom DNS search domains
        --domainname		Container NIS domain name
        --entrypoint		Overwrite the default ENTRYPOINT of the image
        --env , -e		Set environment variables
        --env-file		Read in a file of environment variables
        --expose		Expose a port or a range of ports
        --gpus		API 1.40+
        GPU devices to add to the container (‘all’ to pass all GPUs)
        --group-add		Add additional groups to join
        --health-cmd		Command to run to check health
        --health-interval		Time between running the check (ms|s|m|h) (default 0s)
        --health-retries		Consecutive failures needed to report unhealthy
        --health-start-period		Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)
        --health-timeout		Maximum time to allow one check to run (ms|s|m|h) (default 0s)
        --help		Print usage
        --hostname , -h		Container host name
        --init		Run an init inside the container that forwards signals and reaps processes
        --interactive , -i		Keep STDIN open even if not attached
        --io-maxbandwidth		Maximum IO bandwidth limit for the system drive (Windows only)
        --io-maxiops		Maximum IOps limit for the system drive (Windows only)
        --ip		IPv4 address (e.g., 172.30.100.104)
        --ip6		IPv6 address (e.g., 2001:db8::33)
        --ipc		IPC mode to use
        --isolation		Container isolation technology
        --kernel-memory		Kernel memory limit
        --label , -l		Set meta data on a container
        --label-file		Read in a line delimited file of labels
        --link		Add link to another container
        --link-local-ip		Container IPv4/IPv6 link-local addresses
        --log-driver		Logging driver for the container
        --log-opt		Log driver options
        --mac-address		Container MAC address (e.g., 92:d0:c6:0a:29:33)
        --memory , -m		Memory limit
        --memory-reservation		Memory soft limit
        --memory-swap		Swap limit equal to memory plus swap: ‘-1’ to enable unlimited swap
        --memory-swappiness	-1	Tune container memory swappiness (0 to 100)
        --mount		Attach a filesystem mount to the container
        --name		Assign a name to the container
        --net		Connect a container to a network
        --net-alias		Add network-scoped alias for the container
        --network		Connect a container to a network
        --network-alias		Add network-scoped alias for the container
        --no-healthcheck		Disable any container-specified HEALTHCHECK
        --oom-kill-disable		Disable OOM Killer
        --oom-score-adj		Tune host’s OOM preferences (-1000 to 1000)
        --pid		PID namespace to use
        --pids-limit		Tune container pids limit (set -1 for unlimited)
        --platform		Set platform if server is multi-platform capable
        --privileged		Give extended privileges to this container
        --publish , -p		Publish a container’s port(s) to the host
        --publish-all , -P		Publish all exposed ports to random ports
        --pull	missing	Pull image before running (always, missing, never)
        --quiet , -q		Suppress the pull output
        --read-only		Mount the container’s root filesystem as read only
        --restart	no	Restart policy to apply when a container exits
        --rm		Automatically remove the container when it exits
        --runtime		Runtime to use for this container
        --security-opt		Security Options
        --shm-size		Size of /dev/shm
        --sig-proxy	true	Proxy received signals to the process
        --stop-signal		Signal to stop the container
        --stop-timeout		Timeout (in seconds) to stop a container
        --storage-opt		Storage driver options for the container
        --sysctl		Sysctl options
        --tmpfs		Mount a tmpfs directory
        --tty , -t		Allocate a pseudo-TTY
        --ulimit		Ulimit options
        --user , -u		Username or UID (format: <name|uid>[:<group|gid>])
        --userns		User namespace to use
        --uts		UTS namespace to use
        --volume , -v		Bind mount a volume
        --volume-driver		Optional volume driver for the container
        --volumes-from		Mount volumes from the specified container(s)
        --workdir , -w		Working directory inside the container

