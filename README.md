# php-docker-dev
Php Docker Images for Development

Run for local development:

```
docker run -d \
    --name $(CONTAINER_NAME) \
    --restart=always \
    -p 8089:80 \
    -v $(PWD)/lib:/var/www/lib \
    -v $(PWD)/bin:/var/www/bin \
    -v $(PWD)/src:/var/www/src \
    -v $(PWD)/config:/var/www/config \
    -v $(PWD)/public:/var/www/public \
    -v $(PWD)/vendor:/var/www/vendor \
    -v $(PWD)/var:/var/www/var \
    -v $(PWD)/etc/api:/etc/api:ro \
    hipipe/php-docker-dev
```