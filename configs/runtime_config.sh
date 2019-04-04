#!/bin/bash
sed -i 's/CONFIG proxy.config.http.server_ports STRING *..*/CONFIG proxy.config.http.server_ports STRING '$LIVE_PORT' '$VOD_PORT'/g' /opt/trafficserver/etc/trafficserver/records.config
HOST=$(ifconfig | grep -w inet | awk '{print$2}' | awk -F : 'NR==1{print$2}')
#HOST=`hostname`
echo "hostname=$VOD_ORIGIN volume=1
hostname=$LIVE_ORIGIN volume=2" > /opt/trafficserver/etc/trafficserver/hosting.config
###LIVE

echo "map http://$HOST:$LIVE_PORT http://$LIVE_ORIGIN plugin=header_rewrite.so @pparam=dscp/set_dscp_32.config  @plugin=header_rewrite.so @pparam=hdr_rw_live.config @plugin=collapsed_forwarding.so @plugin=cache_range_requests.so" > /opt/trafficserver/etc/trafficserver/remap.config 


### VOD

echo "map http://$HOST:$VOD_PORT http://$VOD_ORIGIN plugin=header_rewrite.so @pparam=dscp/set_dscp_32.config  @plugin=header_rewrite.so @pparam=header_vod.config @plugin=collapsed_forwarding.so @plugin=cache_range_requests.so" >> /opt/trafficserver/etc/trafficserver/remap.config 

##### Start Trafficserver ############

/opt/trafficserver/bin/traffic_server
