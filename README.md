# Cloudstack in Docker

Files and docker images need to run Apache Cloudstack in Docker container

## Build your own cloudstack docker image

```
docker build -f Dockerfile -t <ANY NAME> .
```

## Run the container

```
docker run --name <ANY suitable name> -p 8080:8080 -d <DOCKER image name created above>
```

## Access the UI

```
http://<IP of machine>:8080/client
```
