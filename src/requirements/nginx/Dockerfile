# 기존에 작성했었던 부분
FROM debian:buster

RUN apt-get update -y && apt upgrade -y
RUN apt-get install nginx -y

# 컨테이너에 openssl 설치하기
RUN apt-get install openssl -y


#------nginx config file-----#
# 미리 작성해둔 default 파일을 컨테이너의 / 디렉토리에 복사
COPY ./conf/default /
# 복사한 파일을 원래 default 파일이 있던 곳으로 옮겨준다
RUN mv default /etc/nginx/sites-available/default


#------인증서---------#
# rsa키 생성
RUN openssl genrsa -out server.key 4096

# 자체인증기관으로 csr파일 만들기
RUN openssl req -new -key server.key -subj "/C=KR/ST=Seoul/O=42seoul/OU=gam/CN=swang" -out server.csr

# 자체서명 인증서 만들기
RUN openssl req -x509 -days 365 -in server.csr -key server.key -out server.crt

# ssl 폴더로 파일들 옮겨주기
RUN mv server.crt /etc/ssl/certs/
RUN mv server.key /etc/ssl/private/

CMD nginx -g "daemon off;"
# ENTRYPOINT ["nginx", "-g", "daemon off;"]