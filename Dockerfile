FROM tiangolo/nginx-rtmp
RUN apt upate && apt install ffmpeg
COPY ./conf/nginx.conf /etc/nginx/nginx.conf