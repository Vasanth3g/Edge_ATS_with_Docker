echo "map http://$HOST:$PORT1 http://$ORIGIN_HOST1" > /opt/trafficserver/etc/trafficserver/remap.config 
/opt/trafficserver/bin/traffic_server
