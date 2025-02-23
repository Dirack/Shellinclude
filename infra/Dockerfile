FROM ghcr.io/dirack/madagascarenvironment:1.0.1
USER root
ENV PYTHONPATH=/home/tryitondocker/madagascar/lib/python2.7/dist-packages
ENV PATH=/home/tryitondocker/madagascar/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV RSFSRC=/home/tryitondocker/madagascar-3.0
ENV DATAPATH=/home/tryitondocker/rsfdata/
COPY . /home/tryitondocker/shellinclude/
RUN echo "Clean APT" && apt-get clean
RUN echo "Installing shellunity..." && echo 'deb [trusted=yes] https://gpgeof.github.io/debian ./' >> /etc/apt/sources.list && apt-get update && apt-get clean && echo "...done"
RUN apt-get install shellunity=0.3.1
WORKDIR /home/tryitondocker/shellinclude
CMD [ "bash" ]