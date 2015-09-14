![](https://avatars2.githubusercontent.com/u/6733935?v=3&s=200)

# sensebat/deluge

[deluge](http://deluge-torrent.org/) Deluge is a lightweight, Free Software, cross-platform BitTorrent client.

* Full Encryption
* WebUI
* Plugin System
* Much more...

## Usage

```
docker create \
  --name deluge \
  -e PUID=<UID> -e PGID=<GID> \
  -p 58946:58946 -p 58946:58946/udp \
  -p 58846:58846 \
  -p 8112:8112 \
  -v </path/to/your/downloads>:/downloads \
  -v </path/to/deluge/config>:/config \
  -v /etc/localtime:/etc/localtime:ro \
  sensebat/deluge
```

**Parameters**

* `-p 58946` - the tcp and udp ports for BitTorrent
* `-p 58846` - the port for the daemon
* `-p 8112` - the port for the web interface
* `-v /config` - deluge configs
* `-v /downloads` - download directory
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e DELUGE_USER` for remote authentication - see below for explanation
* `-e DELUGE_PASSWORD` for remote authentication - see below for explanation

## Default Settings

This build does not try to change unnecessary settings. The only changes made to the default configuration are

* Instead of using `~/Downloads` as the default option, the build uses `/downloads` inside the container.
* Remote connections are enabled by default, as container and host have different NICs and addresses.

To set up default credentials you can use the `DELUGE_USER` and `DELUGE_PASSWORD` environment variables.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes this containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.  

## Updates / Monitoring

* Upgrade to the latest version of deluge simply `docker restart deluge`.
* Monitor the logs of the container in realtime `docker logs -f deluge`.

**Credits**

* sensebat <ihate88@gmail.com>
* pecigonzalo <weedv2@outlook.com>
* lonix <lonixx@gmail.com>
* [LinuxServer.io](http://linuxserver.io)
