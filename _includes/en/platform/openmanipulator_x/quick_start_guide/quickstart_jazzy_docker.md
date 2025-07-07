## Docker Installation (Recommended)

This method provides an isolated environment with all dependencies pre-installed.

### Install Docker and Docker Compose
Follow the official Docker installation guide: [Install Docker Engine](https://docs.docker.com/engine/install/)

### Clone the Repository
```bash
$ git clone -b jazzy https://github.com/ROBOTIS-GIT/open_manipulator.git
$ cd open_manipulator
```

### Container Management
The repository includes a container management script with the following commands:

```bash
# Show help
$ ./docker/container.sh help

# Start container
$ ./docker/container.sh start

# Enter the running container
$ ./docker/container.sh enter

# Stop and remove the container
$ ./docker/container.sh stop
```

{% capture warning_01 %}
**WARNING**: When stopping the container, you'll be asked for confirmation as this will remove all unsaved data in the container.
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

### Data Persistence
The container maps the following directories for data persistence:

- `./docker/workspace:/workspace` - The workspace directory inside the docker folder is mapped to `/workspace` inside the container

{% capture important_01 %}
**IMPORTANT**: Data Persistence Rules:

- Data in `/workspace` inside the container is saved to `docker/workspace` on your host
- Container restart (using `docker restart`) maintains all data
- Container removal (using `container.sh stop`) will remove all data except what's in the mapped `/workspace` directory
- Always save your work in the `/workspace` directory to ensure it persists after container removal
{% endcapture %}
<div class="notice--danger">{{ important_01 | markdownify }}</div>

{% capture setup_complete %}
**Setup Complete**: Docker environment is now ready! Please proceed to the next section to configure the Communication Interface.
{% endcapture %}
<div class="notice--success">{{ setup_complete | markdownify }}</div> 