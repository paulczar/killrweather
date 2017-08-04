#!/bin/bash

until cqlsh -e "describe tables;" $1 > /dev/null; do
  >&2 echo "Cassandra is unavailable - sleeping"
  sleep 1
done

echo create
cqlsh -f create-timeseries.cql $1
echo load
cqlsh -f load-timeseries.cql $1
