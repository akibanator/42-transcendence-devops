#!/bin/bash

# configure the Kibana password in the ES container
# curl -u elastic:elastic \
# 	-X POST \
# 	http://localhost:9200/_security/user/kibana_system/_password \
# 	-d '{"password":"'"kibana"'"}' \
# 	-H 'Content-Type: application/json'

# curl -u elastic:elastic \
# 	-X POST \
# 	http://localhost:9200/_security/user/logstash_system/_password \
# 	-d '{"password":"'"logstash"'"}' \
# 	-H 'Content-Type: application/json'

# curl -u elastic:elastic \
# 	-X POST \
# 	http://localhost:9200/_security/user/beats_system/_password \
# 	-d '{"password":"'"heartbeat"'"}' \
# 	-H 'Content-Type: application/json'

curl -u elastic:elastic \
	-X POST \
	http://localhost:9200/_security/user/beats_system/_password \
	-d '{"password":"'"heartbeat"'"}' \
	-H 'Content-Type: application/json'
