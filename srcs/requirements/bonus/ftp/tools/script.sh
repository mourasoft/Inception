#!/bin/bash
useradd -m $FTP_USER --uid=1000 && echo "$FTP_USER:$FTP_USER_PASSWORD" | chpasswd
chmod -R 755 /home/$FTP_USER/
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER
mkdir -p /var/run/vsftpd/empty/
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

exec "$@"