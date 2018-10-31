# Contents
This repository contains the following Docker images:
- [libtorrent-python](https://hub.docker.com/r/anthonyguerreiro/libtorrent-python/) - libtorrent python bindings using Alpine as base image.
- [libtorrent-python3](https://hub.docker.com/r/anthonyguerreiro/libtorrent-python3/) - libtorrent python3 bindings using Alpine as base image.
- [flexget-python](https://hub.docker.com/r/anthonyguerreiro/flexget-python/) - Flexget running on python with my [configuration](https://github.com/AnthonyGuerreiro/flexget_config), using **libtorrent-python** as base image.
- [flexget-python3](https://hub.docker.com/r/anthonyguerreiro/flexget-python3/) - Flexget running on python3 with my [configuration](https://github.com/AnthonyGuerreiro/flexget_config), using **libtorrent-python3** as base image.
- [rpi-transmission](https://hub.docker.com/r/anthonyguerreiro/rpi-transmission/) - Transmission 2.8+ for the Raspberry Pi.
- [docker-compose](utils/docker-compose) files ready to run *flexget-python* and *transmission* images.
- [default](utils/defaults) files used to build **flexget-python** and **flexget-python3** images.

My Flexget configuration is heavily based on [Jonybat's](https://github.com/Jonybat/flexget_config).

All *libtorrent-python* and *flexget-python* images have a version to run on armv7l architecture, tagged with **armv7l**.

*libtorrent-python:armv7l* and *libtorrent-python3:armv7l* were built, and the python bindings compiled on a Raspberry Pi Model 3B.

*flexget-python:armv7l* and *flexget-python3:arm7l* were built on a x86. I don't know why but, when compiling them on the Rasperry Pi they would not work on the Raspberry Pi itself (as if wrong architecture). They were tested and work on the Raspberry Pi.

## flexget-python

### build
**flexget-python** and **flexget-python3** images are pre-populated with:
- [anime.yml](utils/defaults/anime.yml) (example file with one entry)
- [secrets.yml](utils/defaults/secrets.yml) (example file, values are replaced by *ENV variables*)
- [entrypoint.sh](utils/defaults/entrypoint.sh) (script to replace *ENV variables* in secrets.yml (first run) and startup the container)
- [db-config.sqlite](utils/defaults/db-config.sqlite) (empty *Flexget* database)
- [config.yml](https://raw.githubusercontent.com/AnthonyGuerreiro/flexget_config/master/config.yml) (My *Flexget* configuration)

The image can be built with any other configuration preloaded or a pre-populated flexget database by passing the build args to the *Dockerfile*, such as:

```
docker build -t myimage --build-arg anime_yml_file=path/to/anime.yml \
                        --build-arg secrets_yml_file=path/to/secrets.yml \
                        --build-arg flexget_config_script=path/to/entrypoint.sh \
                        --build-arg flexget_db=path/to/db-config.sqlite \
                        --build-arg config_yml_file=path/to/config.yml .
```

The [entrypoint](utils/defaults/entrypoint.sh) uses the *ENV variables* provided in runtime to finish the configuration by replacing them in **secrets.yml**. It also builds up the folder structure used by my configuration and requests a [trakt](https://trakt.tv/) authentication token on startup.

### runtime
The *ENV variables* are required to run this flexget configuration:
- trakt_user (to fetch series/movies)
- mal_user (to fetch anime)
- pushbullet_token (pushbullet api key obtained from [pushbullet](https://www.pushbullet.com/#settings/account) to notify downloads)

It's also recommended to map a volume to the container /downloads folder to be able to access the downloads directly from the host.

##### Running the container
Example:

`docker run --rm -v /tmp:/downloads -e trakt_user=myuser -e mal_user=myotheruser -e pushbullet_token=myapikey -it anthonyguerreiro/flexget-python3 /bin/sh`

After starting the container for the first time, check logs (or start in interactive mode) to view flexget message requesting access to your trakt account:
```
Accessing trakt for authentication token..
Please visit https://trakt.tv/activate and authorize Flexget. Your user code is 4CD47ACE. Your code expires in 10.0 minutes.
```

Once Flexget receives the authorization, *Flexget daemon* will be started.



## docker-compose
The [docker-compose](utils/docker-compose) files provided start either **flexget-python** or **flexget-python3** container alongside a container running transmission.

The [v3.7](utils/docker-compose/docker-compose.yml) one is a standalone, but the [v1](utils/docker-compose/docker-compose.yml.v1) is provided with a [script](utils/docker-compose/docker-compose-v1.sh) to run it easier, because docker-compose v1 does not support variable substitution.

Both assume the *ENV variables* mentioned in [runtime](#runtime) and an extra *ENV variable* **download_folder** to map the downloads folder between *flexget-python*, *transmission* and the host.

##### docker-compose env variables
The easiest way to provide *ENV variables* to docker-compose is to have a `.env` file in the same directory when running docker-compose.

The script provided to run docker-compose v1 assumes this file exists.

An [example](utils/docker-compose/.env-example) is provided as to what the `.env` file is supposed to look like.

## transmission settings
The default settings use the default transmission ports: 9091 for the web interface and 51413 for DHT (?).

If authentication is required to access the web interface, the default username is *transmission_user* and the default password is *transmission_pw*.

## Special thanks
- The [Flexget community](https://flexget.com/) for creating and continuously improving [Flexget](https://github.com/Flexget/Flexget).
- [Jonybat](https://github.com/Jonybat) for his [Flexget Config](https://github.com/Jonybat/flexget_config) and all the time he sank to tweak it.
- [Sinaptika.net](https://github.com/git-sinaptika) for the base Alpine docker [image](https://github.com/git-sinaptika/libtorrent) with a working libtorrent python binding.
- [Jim Myhrberg](https://github.com/jimeh) for the base Ubuntu docker [image](https://github.com/jimeh/docker-flexget) with a working libtorrent python binding (used on a previous version, before I could compile these on Alpine).