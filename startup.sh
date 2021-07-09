#!/bin/sh
mkdir -p /var/log/elasticsearch
chown elasticsearch.elasticsearch /var/log/elasticsearch
exec "$@"