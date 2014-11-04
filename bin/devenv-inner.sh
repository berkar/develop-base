#!/bin/bash
set -e

DIR="$( cd "$( dirname "$0" )" && pwd )"
APPS=${APPS:-/vagrant/tmp}

killz(){
	echo "Killing all docker containers:"
	docker ps
	ids=`docker ps | tail -n +2 |cut -d ' ' -f 1`
	echo $ids | xargs docker kill
	echo $ids | xargs docker rm
}

stop(){
	echo "Stopping all docker containers:"
	docker ps
	ids=`docker ps | tail -n +2 |cut -d ' ' -f 1`
	echo $ids | xargs docker stop
	echo $ids | xargs docker rm
}

start(){

	mkdir -p $APPS/postgis/data
	mkdir -p $APPS/postgis/logs
	POSTGIS=$(docker run \
		-p  5432:5432 \
		-v $APPS/jboss-as/data:/data \
		-v $APPS/jboss-as/logs:/logs \
		-d \
		mdillon/postgis)
	echo "Started Postgresql/PostGIS in container $POSTGIS"

	mkdir -p $APPS/jboss-as/data
	mkdir -p $APPS/jboss-as/logs
	JBOSS=$(docker run \
		-p 8080:8080 \
		-p 8787:8787 \
		-p 9990:9990 \
		-p 9999:9999 \
		-v $APPS/jboss-as/data:/data \
		-v $APPS/jboss-as/logs:/logs \
		-d \
		jboss/wildfly)
	echo "Started JBoss Wildfly 8.1 in container $JBOSS"

	sleep 1

}

update(){
	apt-get update
	apt-get install -y lxc-docker
	#cp /vagrant/etc/docker.conf /etc/init/docker.conf

	#docker pull berkar/jboss-wildfly-8.1
}

case "$1" in
	restart)
		killz
		start
		;;
	start)
		start
		;;
	stop)
		stop
		;;
	kill)
		killz
		;;
	update)
		update
		;;
	status)
		docker ps
		;;
	*)
		echo $"Usage: $0 {start|stop|kill|update|restart|status|ssh}"
		RETVAL=1
esac
