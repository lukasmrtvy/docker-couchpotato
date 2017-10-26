# docker-couchpotato

## Info:
Based on Alpine:latest

## Usage:
`docker pull lukasmrtvy/docker-couchpotato ; docker rm -f couchpotato; docker run -d --restart always --network my-bridge --name couchpotato -p 5050:5050 -v couchpotato:/config/couchpotato lukasmrtvy/docker-couchpotato`
