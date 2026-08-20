#!/bin/bash

# Check if an email is provided as a command-line argument
if [ $# -eq 0 ]; then
    echo "Error: Please provide an email address as a command-line argument. This email will receive important cerbot notifications"
    exit 1
fi

# Extract the email from the command-line argument
email="$1"

echo "Registering certificates with email: $email"

docker-compose -p gateway down


#removing old gateway files
sudo rm -Rf /app/gateway
mkdir -p /app/gateway/nginx/conf.d
mkdir -p /app/gateway/nginx/sites
mkdir -p /app/gateway/nginx/log
mkdir -p /app/gateway/certbot/letsencrypt
mkdir -p /app/gateway/certbot/www


rsync -avz ./sites/ /app/gateway/nginx/sites
cp ./conf/a_certbot.conf /app/gateway/nginx/conf.d

#Running certboot in order to generate the certificates
docker-compose -p gateway up -d
docker exec -it gateway-gateway-1 certbot certonly --webroot -w /var/www/certbot -d  qa.liftcl.com -m $email --agree-tos
docker exec -it gateway-gateway-1 certbot certonly --webroot -w /var/www/certbot -d  callback-qa.liftcl.com -m $email --agree-tos
docker exec -it gateway-gateway-1 certbot certonly --webroot -w /var/www/certbot -d  ops-qa.liftcl.com -m $email --agree-tos
docker exec -it gateway-gateway-1 certbot certonly --webroot -w /var/www/certbot -d  cdp-qa.liftcl.com -m $email --agree-tos

#Copying all conf to be used by the gateway
cp ./conf/*.conf /app/gateway/nginx/conf.d
docker-compose -p gateway down
docker-compose -p gateway up -d

echo "Gateway restarted with all conf files. Done!"
