FROM ajeetraina/nginx-rtmp-arm
ARG  FFMPEG_VERSION=4.2.1

RUN mkdir -p /tmp/build
# Install dependencies
RUN apt-get update && \
	apt-get install -y \
		wget build-essential ca-certificates \
		openssl libssl-dev yasm \
		libpcre3-dev librtmp-dev libtheora-dev \
		libvorbis-dev libvpx-dev libfreetype6-dev \
		libmp3lame-dev libx264-dev libx265-dev && \
    rm -rf /var/lib/apt/lists/*

# Download ffmpeg source
RUN cd /tmp/build && \
  wget http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.gz && \
  tar -zxf ffmpeg-${FFMPEG_VERSION}.tar.gz && \
  rm ffmpeg-${FFMPEG_VERSION}.tar.gz
  
# Build ffmpeg
RUN cd /tmp/build/ffmpeg-${FFMPEG_VERSION} && \
  ./configure \
	  --enable-version3 \
	  --enable-gpl \
	  --enable-small \
	  --enable-libx264 \
	  --enable-libx265 \
	  --enable-libvpx \
	  --enable-libtheora \
	  --enable-libvorbis \
	  --enable-librtmp \
	  --enable-postproc \
	  --enable-swresample \ 
	  --enable-libfreetype \
	  --enable-libmp3lame \
	  --disable-debug \
	  --disable-doc \
	  --disable-ffplay \
	  --extra-libs="-lpthread -lm" && \
	make -j $(getconf _NPROCESSORS_ONLN) && \
	make install

COPY ./conf/nginx.conf /etc/nginx/nginx.conf