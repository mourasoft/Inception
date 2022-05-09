FROM debian:buster
RUN apt-get update && apt-get install vsftpd -y 
COPY tools /var
COPY config /etc/vsftpd/
RUN chmod -R 777 /var/script.sh
ENTRYPOINT [ "/var/script.sh" ]

CMD [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]

