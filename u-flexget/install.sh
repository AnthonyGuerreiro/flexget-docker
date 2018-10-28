
apt-get update && \
    apt-get install locales && \
    locale-gen en_US.UTF-8

export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8

apt-get install -y \
        python3 \
        python3-pip \
        deluge-common \
        python3-libtorrent \
        build-essential python3-dev libyaml-dev libpython3-dev && \
        python3 -m pip install --upgrade pip==18.1

pip3 install --force-reinstall  "requests==2.18.4" \
                                        "transmissionrpc==0.11" \
                                        "beautifulsoup4==4.6.0" \
                                        "certifi==2017.4.17" \
                                        "chardet==3.0.3" \
                                        "subliminal==2.0.5" \
                                        "click==6.7" \
                                        "guessit==2.0.4" \
                                        "idna==2.5" \
                                        "pytz==2017.2" \
                                        "six==1.10.0" \
                                        "python-dateutil==2.6.1" \
                                        "rebulk==0.8.2" \
                                        "flexget==2.11.21"

apt-get remove -y build-essential python3-dev libyaml-dev libpython3-dev && \
apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*