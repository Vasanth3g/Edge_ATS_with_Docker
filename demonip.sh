IP="$1"
sed -i 's/DEMONIP/'$IP'/g' docker-compose.yml 
