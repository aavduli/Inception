OpenSSL is often used by system administrators and developers to secure communication between servers and clients, 
or to create secure tunnels for transmitting data over the internet. 
It is also used to create secure and encrypted connections for email, file transfer, and other types of internet communication.

Installation part:
pull debian:buster (our base image)
update our package manager apt update -y && apt upgrade -y
apt install -y nginx && apt install openssl -y will install the NGINX web server and the OpenSSL tool.
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt 
-subj "/C=MO/L=KH/O=1337/OU=student/CN=[sahafid.1337.ma](http://sahafid.42.ma/)"

This command generates a self-signed SSL/TLS certificate and private key using OpenSSL.
