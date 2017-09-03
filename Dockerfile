FROM cannin/r-base:ubuntu-16.04_r-3.4.1_java-8

RUN apt-get -qqy update

RUN apt-get install -y -q gdebi-core libapparmor1 supervisor wget
RUN (wget https://download2.rstudio.org/rstudio-server-1.0.153-amd64.deb && gdebi -n rstudio-server-1.0.153-amd64.deb)
RUN rm /rstudio-server-1.0.153-amd64.deb

## Install RStudio
RUN VER=$(wget --no-check-certificate -qO- https://s3.amazonaws.com/rstudio-server/current.ver) \
  && wget -q http://download2.rstudio.org/rstudio-server-${VER}-amd64.deb \
  && dpkg -i rstudio-server-${VER}-amd64.deb \
  && rstudio-server-${VER}-amd64.deb

## Add user
RUN (adduser --disabled-password --gecos "" rstudio && echo "rstudio:rstudio"|chpasswd)

## Setup lang
RUN locale-gen en_US en_US.UTF-8

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN update-locale

EXPOSE 8787

CMD ["/usr/bin/supervisord"]
