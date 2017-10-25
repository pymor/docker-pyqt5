ARG PYVER=3.5
FROM pymor/python:$PYVER
MAINTAINER René Milk <rene.milk@wwu.de>

# python qt5
RUN echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list && \
    apt-get update && apt-get build-dep -y python3-pyqt5 && \
    cd /tmp/ && apt-get source python3-pyqt5 && \
    apt-get remove -y python3-sip && apt-get source python3-sip && \
    cd /tmp/sip4-4.18.1+dfsg && \
    python configure.py && \
    make && \
    make install && \
    cd /tmp/pyqt5-5.7+dfsg && \
    python configure.py --qmake=/usr/lib/x86_64-linux-gnu/qt5/bin/qmake --confirm-license && \
    make install

ONBUILD COPY /usr/local/ /usr/local
