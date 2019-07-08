ARG PYVER=3.7
FROM pymor/python:$PYVER
MAINTAINER René Fritze <rene.fritze@wwu.de>

ENV PYQT_VERSION=5.12.3

# python qt5
RUN apt-get update && apt-get install -y libgl1 
RUN pip install pyqt5 \
    && python -c 'from PyQt5 import QtCore, QtGui, QtWidgets '
