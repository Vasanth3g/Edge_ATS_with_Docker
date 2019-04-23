# Edge_ATS_with_Docker
Apache Trafficserver in a Docker Container

# What is Traffic Server ?
Apache Trafficserver(ATS) is a Highly Scalable , Proxy server and Cache based Servers .For large media distribution its performed well . its also used for CDN based Traffic Controller acts as end point Client Devices. The Docker image for most common use for micro-services in real world to create enlarge cluster to deploy scaling a large containers such as AWS EKS , Kubernetes , Rancher etc ..

# Use case for this Image :

Need to had some parameters before for run this container .First of all chosen environment variables for _LIVE LINEAR and VOD platform . So Declared as _LIVE LINEAR_ and _VOD_ environment variables such as _PORTS , ORIGIN SERVERS_ etc .And the basic Configurations and tuning for high traffic handles and it did automatically while start the container will be configure itself .

Need to create custom network such as bridge , overlay and macvlan .Most common use case bridge networking for hosted on single machine. For Overlay , if create as cluster based topology  for some cases  such as Docker swarm , Kubernetes so on .

First need to build docker image for Container , Use below file to build command like that

```
docker build -t <tag name> -f DockerFile . 
```
Note : if Need to pull above build image directly  from _docker hub_ [vasanth3g/apache_trafficserver](https://hub.docker.com/r/vasanth3g/apache_trafficserver)

```
docker run -it -d --net -p <port:container:port for live> -p <port:container:port for live> -e HOST="" -e LIVE_PORT="" -e LIVE_ORIGIN="" -e VOD_PORT="" -e VOD_ORIGIN=""**
```

Note : Need to be create a file for Environment Variables like filename _env.list_ . It contains all environment variables and pass the arguments using _--env-file_ flag.

# Using docker compose to set live(httpd) and vod(nginx) orgins with trafficserver :

```
docker-compose up -d 
```
Note : Must installed _docker-compose binary_ for more details [compose install tutorial](https://docs.docker.com/compose/install/)

For more about details visit on [Apache Trafficserver](https://docs.trafficserver.apache.org/).
