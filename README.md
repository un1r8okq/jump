# Jump
This repository contains a Dockerfile and some configuration used to host a jump server.

# Getting started
1. Have [Docker](https://docs.docker.com/engine/) and [Docker Compose](https://docs.docker.com/compose/install/) installed
2. Add your user and public key to the array at the top of `./src/root/add-users.sh`
3. Run `docker-compose up`
4. Test out the SSH connection with `ssh localhost:2222`
