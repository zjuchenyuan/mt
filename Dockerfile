FROM zjuchenyuan/base
RUN wget -q https://golang.org/dl/go1.15.3.linux-amd64.tar.gz &&\
    tar -C /usr/local -xzf go1.15.3.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin
#wget http://ffmpeg.org/releases/ffmpeg-4.3.1.tar.bz2
ADD ./ffmpeg-4.3.1.tar.bz2 /tmp/
RUN cd /tmp/ffmpeg-4.3.1 &&\
    ./configure --disable-yasm --disable-programs --disable-doc --prefix=/tmp/ffmpeg &&\
    make --silent -j`nproc` && make install --silent &&\
    apt update && apt install -y libavcodec-dev libavformat-dev libavutil-dev libswscale-dev 
ADD . /mt
RUN cd /mt &&\
    go get github.com/mutschler/mt;\
    bash mymake.sh
