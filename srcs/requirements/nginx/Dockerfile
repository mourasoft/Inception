FROM debian:buster 
RUN apt-get update && apt-get install nginx -y 
COPY tools /etc/nginx
COPY conf /etc/nginx/sites-available 
CMD  ["nginx", "-g", "daemon off;"]

