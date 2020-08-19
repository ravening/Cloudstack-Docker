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


## Deploying in Kubernetes

### First deploy the pod

```
kubectl apply -f deployment.yml
```

### Now apply the service

```
kubectl apply -f service.yml
```

### Now create the nginx ingress rules

```
kubectl apply -f ingress.yml
```

### Access the ui

We have provided `/cloudstack` as the end point in `ingress.yml`, so access the ui using

```
http://<IP of Kubernetes cluster>/cloudstack
```

This will redirect to `/client`

If you want to deploy multiple cloudstack versions then have multiple deployment and service.

Add extra rules in `ingress.yml`.

If you have deployed cloudstack 4.14 in service/deployment cloudstack414

```
- path: /cloudstack/414
  backend:
    serviceName: cloudstack414
    servicePort: 8080
```

If you have deployed cloudstack 4.15 in service/deployment cloudstack415

```
- path: /cloudstack/415
  backend:
    serviceName: cloudstack415
    servicePort: 8080
```
