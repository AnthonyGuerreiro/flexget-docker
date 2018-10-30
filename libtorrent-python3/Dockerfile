# Based on https://github.com/git-sinaptika/libtorrent/blob/master/1.1.6/Dockerfile
# alpine with Python 3.6.6 and pip 10.0.1
FROM alpine:3.8

ENV \
  LIBTORRENT_VERSION="1.1.6" \
  _LIBTORRENT_VERSION="1_1_6"

WORKDIR \
  /opt

#Libtorrent
#If you need static, remove/change --enable-static=no .
#If building locally, you can run make -j$(nproc),
#but you might get issues with swap/out of memory
RUN \
  apk add --no-cache --virtual .build_libtorrent \
    wget ca-certificates alpine-sdk boost-dev libressl-dev python3-dev && \
  wget -qO-\
    https://github.com/arvidn/libtorrent/releases/download/libtorrent-${_LIBTORRENT_VERSION}/libtorrent-rasterbar-${LIBTORRENT_VERSION}.tar.gz | \
    tar xvz && \
  cd libtorrent-rasterbar-${LIBTORRENT_VERSION} && \
  ./configure \
    --build=$CBUILD \
    --host=$CHOST \
    --prefix=/usr \
    --enable-python-binding PYTHON=`which python3` \
    --with-boost-python=boost_python3 \
    --enable-static=no \
    --with-boost-system=boost_system \
    --with-libiconv=yes \
    --enable-debug=no \
    --enable-silent-rules && \
  make && \
  make install-strip && \
  strip /usr/lib/python3.6/site-packages/libtorrent.cpython*.so && \
  cd /opt && \
  rm -rf libtorrent-rasterbar-${LIBTORRENT_VERSION} && \
  apk del .build_libtorrent && \
  apk add --no-cache --virtual .runtime_libtorrent \
    boost-python3 boost-system libgcc libstdc++ python3 && \
  ldconfig /usr/lib && \
  if [ -f /usr/bin/python ] ; then rm /usr/bin/python; fi && ln -s /usr/bin/python3 /usr/bin/python && \
  if [ -f /usr/bin/pip ] ; then rm /usr/bin/pip; fi && ln -s /usr/bin/pip3 /usr/bin/pip
