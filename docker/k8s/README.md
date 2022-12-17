# Kubernetes infra for Jepsen

Building on the foundation laid in the Docker Compose approach, 
this uses Cloud Native (TM) approaches to make state sharing & local DX a bit better.

running `skaffold dev` in the root of the Jepsen repo will build the docker containers, 
and deploy them to the currently-configured Kubernetes cluster. For example, Docker for Mac.

## TODO

- Experiment with Podman; might be able to drop `privileged` container running.
- Add a templatable patch for replica count