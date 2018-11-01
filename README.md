# Contents
This repository contains the following Docker images:
- [libtorrent-python](https://hub.docker.com/r/anthonyguerreiro/libtorrent-python/) - libtorrent python bindings using Alpine as base image.
- [libtorrent-python3](https://hub.docker.com/r/anthonyguerreiro/libtorrent-python3/) - libtorrent python3 bindings using Alpine as base image.
- [flexget-python](https://hub.docker.com/r/anthonyguerreiro/flexget-python/) - Flexget running on python using **libtorrent-python** as base image.
- [flexget-python3](https://hub.docker.com/r/anthonyguerreiro/flexget-python3/) - Flexget running on python3 using **libtorrent-python3** as base image.

*[libtorrent-python](https://hub.docker.com/r/anthonyguerreiro/libtorrent-python/tags/)* and *[libtorrent-python3](https://hub.docker.com/r/anthonyguerreiro/libtorrent-python3/tags/)* were built for x86 and armv7l (Raspberry Pi Model 3B).

*flexget-python* and *flexget-python3* were built on a x86 both for x86 and for armv7l.
These images provide no configuration for Flexget but are a starting point with the following installed:
- Python
- Flexget
- libtorrent python bindings

These libtorrent python bindings are needed by some Flexget plugins such as the *[convert_magnet](https://github.com/Flexget/Flexget/blob/develop/flexget/plugins/modify/convert_magnet.py)*.

If your configuration has no need for these, I would suggest building another Flexget Docker image based on Alpine instead of *libtorrent-python*,
or use other python or Flexget Docker images published in the Docker Hub.

# Published images 

*[libtorrent-python](https://hub.docker.com/r/anthonyguerreiro/libtorrent-python/)* and *[libtorrent-python3](https://hub.docker.com/r/anthonyguerreiro/libtorrent-python3/)* are published in the Docker Hub. The versions tagged with *armv7l* are the ones built on the Raspberry Pi.

*flexget-python* and *flexget-python3* are published in the Docker Hub and tagged with the Flexget version installed.
- [flexget-python](https://hub.docker.com/r/anthonyguerreiro/flexget-python/tags/) - Runs Flexget on python on x86
- [flexget-python3](https://hub.docker.com/r/anthonyguerreiro/flexget-python3/tags/) - Runs Flexget on python3 on x86
- [flexget-python](https://hub.docker.com/r/anthonyguerreiro/flexget-python-armv7l/tags/) - Runs Flexget on python on armv7l
- [flexget-python3](https://hub.docker.com/r/anthonyguerreiro/flexget-python3-armv7l/tags/) - Runs Flexget on python3 on armv7l

# Configuration example

As with any Docker image, you can setup everything manually or you can build your own image.

Here's how I build my [configuration](https://github.com/AnthonyGuerreiro/flexget-docker-config/) on a Docker image based  on *flexget-python* or *flexget-python3* Docker images.

The purpose of this example is to show a way to setup your own Docker image with your Flexget configuration, not to configure Flexget itself.


## Special thanks
- The [Flexget community](https://flexget.com/) for creating and continuously improving [Flexget](https://github.com/Flexget/Flexget).
- [Jonybat](https://github.com/Jonybat) for his [Flexget Config](https://github.com/Jonybat/flexget_config) and all the time he sank to tweak it.
- [Sinaptika.net](https://github.com/git-sinaptika) for the base Alpine docker [image](https://github.com/git-sinaptika/libtorrent) with a working libtorrent python binding.
- [Jim Myhrberg](https://github.com/jimeh) for the base Ubuntu docker [image](https://github.com/jimeh/docker-flexget) with a working libtorrent python binding (used on a previous version, before I could compile these on Alpine).