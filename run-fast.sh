#!/bin/sh
JAR=$1
DUMP=$2
INDEX=$3
INDEX=${3:-"en-wikipedia"}
ES="http://localhost:9200"
bzip2 -dcf $DUMP | java -Xmx3g -Xms3g -jar $JAR --index $INDEX -p redirects --es $ES && bzip2 -dcf $DUMP | java -Xmx3g -Xms3g -jar $JAR --index $INDEX -p full --es $ES
