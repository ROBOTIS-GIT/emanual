This method provides an isolated environment with all dependencies pre-installed.

**NOTE**: Docker Environment is supported for ROS 2 Humble, but detailed manual documentation is provided starting from the Jazzy version. Please refer to the [Jazzy Docker Environment](/docs/en/platform/openmanipulator_x/quick_start_guide/#docker-environment) for comprehensive setup instructions.
{: .notice--info}

#### Install Docker and Docker Compose

**Container Engine**: Docker Engine

Follow the [official Docker installation guide](https://docs.docker.com/engine/install/ubuntu/) and complete the [post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/).

**Required steps**:
1. [Install Docker Engine](https://docs.docker.com/engine/install/ubuntu/) using the repository method
2. Add your user to the docker group
3. Enable Docker to start on boot
4. Verify installation with `docker run hello-world`

#### Clone the Repository
```bash
$ git clone -b humble https://github.com/ROBOTIS-GIT/open_manipulator.git
$ cd open_manipulator
```

#### Container Management
Use Docker Compose to manage the container:

```bash
# Start container
$ docker compose up -d --build

# Stop and remove the container
$ docker compose down
```

{% capture warning_01 %}
**WARNING**: When stopping the container with `docker compose down`, all unsaved data in the container will be removed.
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

#### Data Persistence
The container maps the following directories for data persistence:

- `./docker/workspace:/workspace` - The workspace directory inside the docker folder is mapped to `/workspace` inside the container

{% capture important_01 %}
**IMPORTANT**: Data Persistence Rules:

- Data in `/workspace` inside the container is saved to `docker/workspace` on your host
- Container restart maintains all data
- Container removal (using `docker compose down`) will remove all data except what's in the mapped `/workspace` directory
- Always save your work in the `/workspace` directory to ensure it persists after container removal
{% endcapture %}
<div class="notice--danger">{{ important_01 | markdownify }}</div>

{% capture setup_complete %}
**Setup Complete**: Docker environment is now ready! Please proceed to the next section to configure the Communication Interface.
{% endcapture %}
<div class="notice--success">{{ setup_complete | markdownify }}</div> 