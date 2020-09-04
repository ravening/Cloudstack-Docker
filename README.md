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

You can deploy in kubernetes either manually or you can use skaffold for continuous development.\
If you want to use skaffold then refer to the next section `Continuous development using skaffold`

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


## Continuous development using skaffold

You can either use the existing `skaffold.yaml` file or you can create your own using `skaffold init`.

Once you have the `skaffold.yaml` ready, you can just run the below command

```
skaffold dev
```

This will build docker image and deploys it to kubernetes/minikube.

If you make change to the source code, skaffold will automatically build new docker image and deploys it again.

If you dont want to deploy to kubernetes then you can just build the docker image using
```
skaffold build
```
