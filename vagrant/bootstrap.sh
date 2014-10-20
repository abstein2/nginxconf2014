#!/usr/bin/env bash

apt-get update;
apt-get install -y python-software-properties;
nginx=stable;
add-apt-repository -y ppa:nginx/$nginx;
apt-get update;
apt-get install -y nginx geoip-bin curl;

rm -rf /etc/nginx/sites-enabled/default;
for CONFIG in $(find /vagrant/nginx_configurations/ -name *.conf);
do
	ln -s ${CONFIG} /etc/nginx/sites-enabled/ ;
done;

nginx -s reload;