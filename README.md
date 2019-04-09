# Edge_ATS_with_Docker
trafficserver

Apache Trafficserver(ATS) is a Highly Scalable , Proxy server and Cache based Servers .For large media distribution its performed well . its also used for CDN based Traffic Controller acts as end point Client Devices. Now we made the Docker image for most common use for micro-services in real world to create enlarge cluster to deploy scaling a large containers such as AWS EKS , Kubernetes , Rancher etc ..

# Use case for this Image :

Need to had some parameters before for run this container .First of all chosen environment variables for LIVE and VOD platform . So Declared as LIVE and VOD environment variables such as PORTS , ORIGIN servers etc .And the basic Configurations and tuning for high traffic handles and it did automatically while start the container will be configure itself .

Need to create custom network such as bridge , overlay and macvlan .Most common use case bridge networking for hosted on single machine. For Overlay , if create cluster based topology some cases Docker swarm , Kubernetes so on .

docker run -it -d --net -p <port:container:port for live> -p <port:container:port for live> -e HOST="" -e LIVE_PORT="" -e LIVE_ORIGIN="" -e VOD_PORT="" -e VOD_ORIGIN=""

# Note : Need to be create a file for Environment Variables like filename "env.list" . It contains all environment variables and pass the arguments using "--env-file " flag.
