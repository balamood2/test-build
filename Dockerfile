FROM nginx:alpine
WORKDIR /app
COPY . .

ADD ./nginx.conf /etc/nginx/
 


