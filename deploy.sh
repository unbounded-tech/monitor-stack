docker stack deploy -c monitor.yml monitor
sleep 30
docker stack deploy -c exporters.yml exporters
