#!/bin/bash

service postgresql start
service redis-server start

# Keep the container running indefinitely
tail -f /dev/null
