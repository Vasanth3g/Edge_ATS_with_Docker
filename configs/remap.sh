#!/bin/bash

echo "map http://$HOST:$PORT1 http://$ORIGIN_HOST1 plugin=header_rewrite.so @pparam=dscp/set_dscp_32.config  @plugin=header_rewrite.so @pparam=hdr_rw_live.config @plugin=collapsed_forwarding.so @plugin=cache_range_requests.so" > /opt/trafficserver/etc/trafficserver/remap.config 
/opt/trafficserver/bin/traffic_server
