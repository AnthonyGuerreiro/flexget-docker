FROM anthonyguerreiro/libtorrent-python:1

ARG PIP_VERSION=10.0.1
ARG FLEXGET_VERSION=2.11.21

WORKDIR /.flexget

RUN apk add --no-cache findutils py-pip && \
    python -m pip install --no-cache-dir --upgrade pip==${PIP_VERSION} && \
    pip install --no-cache-dir flexget==${FLEXGET_VERSION}

VOLUME ["/downloads"]

CMD ["rm", "-f", "/.flexget/.config-lock", "2>", "/dev/null", "&&", "flexget", "daemon", "start"]