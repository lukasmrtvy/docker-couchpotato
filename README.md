# docker-couchpotato

`sudo docker build --no-cache -t couchpotato . ; sudo docker stop couchpotato && sudo docker rm couchpotato ; sudo docker run -d -p 5050:5050 --name couchpotato --restart always -v couchpotato:/root/.couchpotato/ couchpotato ; sudo docker logs couchpotato`
