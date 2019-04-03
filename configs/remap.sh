#!/bin/bash

HOST=`hostname`
###LIVE

echo "map http://$HOST:$LIVE_PORT http://$LIVE_ORIGIN plugin=header_rewrite.so @pparam=dscp/set_dscp_32.config  @plugin=header_rewrite.so @pparam=hdr_rw_live.config @plugin=collapsed_forwarding.so @plugin=cache_range_requests.so" > /opt/trafficserver/etc/trafficserver/remap.config 


### VOD

echo "map http://$HOST:$VOD_PORT http://$VOD_ORIGIN plugin=header_rewrite.so @pparam=dscp/set_dscp_32.config  @plugin=header_rewrite.so @pparam=header_vod.config @plugin=collapsed_forwarding.so @plugin=cache_range_requests.so" >> /opt/trafficserver/etc/trafficserver/remap.config 

##### Start Trafficserver ############

/opt/trafficserver/bin/traffic_server
