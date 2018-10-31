FROM sdhibit/rpi-raspbian

VOLUME /downloads

RUN apt-get update && \
    apt-get install --no-install-recommends -y transmission-daemon=2.84-0.2+deb8u1 curl=7.38.0-4+deb8u12 && \
    apt-get clean && apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/*

EXPOSE 9091 51413/tcp 51413/udp

CMD ["transmission-daemon", "-c", "/watch", "-w", "/downloads", "-f", "-t", "-a", "*.*.*.*,transmission", "-u", "transmission_user", "-v", "transmission_pw"]
