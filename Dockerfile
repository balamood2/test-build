FROM nginx:alpine
WORKDIR /app

COPY ./app/ .

ADD ./nginx.conf /etc/nginx/
 


