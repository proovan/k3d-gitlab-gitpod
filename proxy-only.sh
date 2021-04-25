#!/usr/bin/env bash


DOMAIN="$1"
DNSSERVER="$2"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT_DIR=$SCRIPT_DIR
GPSH_DIR=$ROOT_DIR/gitpod-self-hosted
GITLAB_DIR=$ROOT_DIR/gitlab
CERTS=$GPSH_DIR/secrets/https-certificates

# Start reverse proxy
echo "Starting reverse proxy ..."
sed "s+example.com+$DOMAIN+g" "$ROOT_DIR/proxy/nginx-virtual-servers.conf" > "$ROOT_DIR/proxy/default.conf"
docker run --rm --name nginx-proxy \
    -v "$ROOT_DIR/proxy/default.conf:/etc/nginx/conf.d/default.conf" \
    -v "$CERTS/fullchain.pem:/etc/nginx/certs/fullchain.pem" \
    -v "$CERTS/privkey.pem:/etc/nginx/certs/privkey.pem" \
    -p 0.0.0.0:443:443 -d nginx

echo "Done."
