FROM ubuntu:16.04

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

ADD install.sh /scripts/
RUN chmod +x /scripts/install.sh

RUN /scripts/install.sh

ADD init.sh /scripts/init.sh
RUN chmod +x /scripts/init.sh

ADD config.yml /.flexget/config.yml

VOLUME ["/root/food"]

WORKDIR /.flexget

CMD ["/scripts/init.sh"]