#!/bin/bash

curl -u elastic:elastic \
	-X POST \
	http://localhost:9200/_security/user/kibana_system/_password \
	-d '{"password":"'"kibana"'"}' \
	-H 'Content-Type: application/json'

curl -u elastic:elastic \
	-X POST \
	http://localhost:9200/_security/role/logstash_writer \
	-d '{
        "cluster": ["manage_index_templates", "monitor", "manage_ilm"], 
        "indices": [
          {
            "names": [ "logstash-*" ], 
            "privileges": ["write","create","create_index","manage","manage_ilm"]  
          }
        ]
  }' \
	-H 'Content-Type: application/json'

curl -u elastic:elastic \
	-X POST \
	http://localhost:9200/_security/user/logstash_internal \
	-d '{
        "password" : "logstash",
        "roles" : [ "logstash_writer"],
        "full_name" : "Internal Logstash User"
  }' \
	-H 'Content-Type: application/json'

# curl -u elastic:elastic \
# 	-X POST \
# 	http://localhost:9200/_security/user/beats_system/_password \
# 	-d '{"password":"'"heartbeat"'"}' \
# 	-H 'Content-Type: application/json'

# curl -u elastic:elastic \
# 	-X POST \
# 	http://localhost:9200/_security/user/beats_system/_password \
# 	-d '{"password":"'"heartbeat"'"}' \
# 	-H 'Content-Type: application/json'
