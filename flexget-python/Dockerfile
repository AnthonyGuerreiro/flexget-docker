FROM anthonyguerreiro/libtorrent-python:1

ARG anime_yml_file=https://raw.githubusercontent.com/AnthonyGuerreiro/flexget-docker/master/utils/init/anime.yml
ARG secrets_yml_file=https://raw.githubusercontent.com/AnthonyGuerreiro/flexget-docker/master/utils/init/secrets.yml
ARG flexget_config_script=https://raw.githubusercontent.com/AnthonyGuerreiro/flexget-docker/master/utils/init/flexget_config_script.sh
ARG flexget_db=https://raw.githubusercontent.com/AnthonyGuerreiro/flexget-docker/master/utils/init/db-config.sqlite
ARG config_yml_file=https://raw.githubusercontent.com/AnthonyGuerreiro/flexget_config/master/config.yml

WORKDIR /.flexget

ADD ${flexget_db} db-config.sqlite
ADD ${anime_yml_file} anime.yml
ADD ${secrets_yml_file} secrets.yml
ADD ${config_yml_file} config.yml

ADD ${flexget_config_script} /scripts/flexget_config_script.sh

ADD https://raw.githubusercontent.com/AnthonyGuerreiro/flexget_config/master/plugins/log_filter.py plugins/log_filter.py
ADD https://raw.githubusercontent.com/AnthonyGuerreiro/flexget_config/master/plugins/myanimelist.py plugins/myanimelist.py
ADD https://raw.githubusercontent.com/AnthonyGuerreiro/flexget_config/master/plugins/rawlist.py plugins/rawlist.py

RUN apk add --no-cache findutils py-pip && \
    python -m pip install --upgrade pip==18.1 && \
    pip install flexget==2.11.21 \
                transmissionrpc==0.11 \
                subliminal==2.0.5 && \
    chmod +x /scripts/flexget_config_script.sh

VOLUME ["/downloads"]

ENTRYPOINT ["sh", "/scripts/flexget_config_script.sh"]
