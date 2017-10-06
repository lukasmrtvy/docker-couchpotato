# docker-couchpotato

## Info:
Based on Alpine:latest

## Usage:
`docker rm -f couchpotato; sudo docker run -d --restart always --name couchpotato -p 5050:5050 -v /docker/couchpotato:/config/couchpotato lukasmrtvy/docker-couchpotato`
