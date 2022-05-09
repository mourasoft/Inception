FROM debian:buster
RUN apt-get update && apt-get install -y redis-server
COPY conf /etc/redis
CMD ["redis-server", "/etc/redis/redisc.conf"]