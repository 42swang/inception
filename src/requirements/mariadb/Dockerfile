FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY ./tools/maria-c.sh /

ENTRYPOINT ["sh", "./maria-c.sh"]