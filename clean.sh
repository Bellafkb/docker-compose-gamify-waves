#!/bin/bash
docker-compose stop && 
docker-compose rm &&
docker-compose up --build -d && 
docker exec -it thesis_mariadb_1 bash  