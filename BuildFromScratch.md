# Building working cloudstack docker image from scratch

Checkout the Cloudstack repo from [here](https://github.com/apache/cloudstack.git)

## Build plain docker image

```
cd tools/docker
docker build -f Dockerfile -t cloudstack/simulator ../..
```

## Start the above built docker container

```
docker run --name simulator -p 8080:8080 -d cloudstack/simulator
```

## Ssh to cloudstack container and get its ip address
```
docker exec -it <container id> /bin/bash
$ ip a
```

## Now run the simulator
```
docker run -ti --rm --name marvin --link simulator:8096 cloudstack/marvin
```

## Change the mgtSvr and dbSvr ip address in below files to the ip of cloudstack docker container
```
/marvin/dev/advanced.cfg
```

## Now deploy the zone
```
python /marvin/marvin/deployDataCenter.py -i /marvin/dev/advanced.cfg
```

Once the deployment is complete make sure you can access the UI. Now get the dump of mysql db's

```
mysqldump cloud > cloud.sql
mysqldump cloud_usage > cloud_usage.sql
mysqldump simulator > simulator.sql
```

These files will be stored in `/root` folder

## Create a new docker image

Now create a new docker image using the above running docker container so that you need to setup the zone\
everytime a start a new cloudstack docker container

```
docker commit <id of running container> <any name you want>
```

This will create a new image of the running container

You can stop the original container and start the container from the newly created image\
to make sure that everything works fine and you dont need to setup the zone again.

Once this is done, you can use the `Dockerfile` present in this repo to do the incremental build for cloudstack.\
Change the container name in the `Dockerfile` with the image you uploaded to dockerhub.
