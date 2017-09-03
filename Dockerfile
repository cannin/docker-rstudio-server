FROM cannin/r-base:ubuntu-16.04_r-3.4.1_java-8

RUN apt-get -qqy update

RUN apt-get install -y -q gdebi-core libapparmor1 supervisor wget
RUN (wget https://download2.rstudio.org/rstudio-server-1.0.153-amd64.deb && gdebi -n rstudio-server-1.0.153-amd64.deb)
RUN rm /rstudio-server-1.0.153-amd64.deb

RUN (adduser --disabled-password --gecos "" guest && echo "guest:guest"|chpasswd)

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN update-locale

EXPOSE 8787

CMD ["/usr/bin/supervisord"]
