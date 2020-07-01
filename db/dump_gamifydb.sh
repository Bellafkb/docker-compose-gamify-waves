#!/bin/bash
docker exec gamifydb /usr/bin/mysqldump -u root --password=password gamifydb > dump$(date +%s).sql
