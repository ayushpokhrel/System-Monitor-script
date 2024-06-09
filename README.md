# System-Monitor-script

This is a simple shell script that monitors system resources such as CPU usage, memory usage, disk usage, and network activity.

## Usage

To run the script locally:

```bash
./system_monitor.sh

#To run the script in a Docker container:
docker build . -t system_monitor:1
docker run system_monitor:1

if asked permission, provide sudo privilage to the docker.

Thanks 
