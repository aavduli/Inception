FROM debian:bullseye

RUN apt update; \
	apt install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/aavduli.key \
	-out /etc/ssl/certs/aavduli.crt \
	-subj="/C=CH/ST=VAUD/L=LAUSANNE/O=42Lausanne/OU=aavduli/CN=aavduli.42.fr"

COPY ./tools/certs.sh /tmp/certs.sh

RUN chmod +x /tmp/certs.sh

COPY ./conf/default.conf /etc/nginx/site-available/default.conf

ENTRYPOINT ["/tmp/certs.sh" ]
