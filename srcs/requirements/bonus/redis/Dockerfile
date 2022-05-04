FROM debian:buster
RUN apt-get update && apt-get install -y redis-server
# RUN sed -i 's/bind 127.0.0.1 ::1/bind 0.0.0.0 ::0/g' 
COPY conf /etc/redis
CMD ["redis-server", "/etc/redis/redisc.conf"]