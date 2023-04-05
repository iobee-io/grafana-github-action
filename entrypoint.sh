#!/bin/sh

VERSION=$1
PORTS=$2
CONTAINERNAME=$3
GF_SECURITY_ADMIN_USER=$4
GF_SECURITY_ADMIN_PASSWORD=$5
GF_AUTH_ANONYMOUS_ENABLED=$6
GF_AUTH_BASIC_ENABLED=$7
GF_AUTH_GENERIC_OAUTH_ENABLED=$8
GF_AUTH_PROXY_ENABLED=$9
GF_AUTH_LDAP_ENABLED=$10
GF_AUTH_GRAFANA_ENABLED=$11
GF_AUTH_GRAFANA_API_KEY=$12



docker_run="docker run --detach --name $CONTAINERNAME"

for i in $(echo $PORTS | tr " " "\n")
do
  docker_run="$docker_run --publish $i"
done

if [ -n "$GF_SECURITY_ADMIN_USER" ]; then
  docker_run="$docker_run -e GF_SECURITY_ADMIN_USER=$GF_SECURITY_ADMIN_USER"
fi
if [ -n "$GF_SECURITY_ADMIN_PASSWORD" ]; then
  docker_run="$docker_run -e GF_SECURITY_ADMIN_PASSWORD=$GF_SECURITY_ADMIN_PASSWORD"
fi
if [ -n "$GF_AUTH_ANONYMOUS_ENABLED" ]; then
  docker_run="$docker_run -e GF_AUTH_ANONYMOUS_ENABLED=$GF_AUTH_ANONYMOUS_ENABLED"
fi
if [ -n "$GF_AUTH_BASIC_ENABLED" ]; then
  docker_run="$docker_run -e GF_AUTH_BASIC_ENABLED=$GF_AUTH_BASIC_ENABLED"
fi
if [ -n "$GF_AUTH_GENERIC_OAUTH_ENABLED" ]; then
  docker_run="$docker_run -e GF_AUTH_GENERIC_OAUTH_ENABLED=$GF_AUTH_GENERIC_OAUTH_ENABLED"
fi
if [ -n "$GF_AUTH_PROXY_ENABLED" ]; then
  docker_run="$docker_run -e GF_AUTH_PROXY_ENABLED=$GF_AUTH_PROXY_ENABLED"
fi
if [ -n "$GF_AUTH_LDAP_ENABLED" ]; then
  docker_run="$docker_run -e GF_AUTH_LDAP_ENABLED=$GF_AUTH_LDAP_ENABLED"
fi
if [ -n "$GF_AUTH_GRAFANA_ENABLED" ]; then
  docker_run="$docker_run -e GF_AUTH_GRAFANA_ENABLED=$GF_AUTH_GRAFANA_ENABLED"
fi
if [ -n "$GF_AUTH_GRAFANA_API_KEY" ]; then
  docker_run="$docker_run -e GF_AUTH_GRAFANA_API_KEY=$GF_AUTH_GRAFANA_API_KEY"
fi


docker_run="$docker_run grafana/grafana:$VERSION"

echo "$docker_run"
sh -c "$docker_run"
