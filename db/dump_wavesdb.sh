#!/bin/bash
docker exec wavesdb /usr/bin/mysqldump -u root --password=password wavesdb > dump$(date +%s).sql
