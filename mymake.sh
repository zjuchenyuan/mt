PKG_CONFIG_LIBDIR=/tmp/ffmpeg/lib/pkgconfig/ LD_LIBRARY_PATH=/tmp/ffmpeg/lib/ go build |&  grep cannot |cut -d'"' -f2|xargs go get
PKG_CONFIG_LIBDIR=/tmp/ffmpeg/lib/pkgconfig/ LD_LIBRARY_PATH=/tmp/ffmpeg/lib/ go build
