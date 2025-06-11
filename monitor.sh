#!/bin/bash
# Simple log tail script to send logs to Solr

LOGFILE="logs/sample.log"

tail -f $LOGFILE | while read line; do
  curl "http://localhost:8983/solr/logs/update/json/docs" \
       -H "Content-Type: application/json" \
       -d "{\"log\":\"$line\", \"timestamp\":\"$(date -Iseconds)\"}"
done
