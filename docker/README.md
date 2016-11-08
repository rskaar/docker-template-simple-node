# Docker stuff

## Alpine security // harden.sh
The `root` user is not password protected in the `alpine` image. In order to
add some security, we run a script to remove root and other vulnerabilities.

### References
[Unprivileged user can gain root privileges](https://github.com/gliderlabs/docker-alpine/issues/59)

[Default Alpine images have insecure /usr/bin, /bin/, /usr/sbin/, /sbin](https://github.com/gliderlabs/docker-alpine/issues/56)

Gist from jumanjiman:
<https://gist.github.com/jumanjiman/f9d3db977846c163df12>

Gist from kost:
<https://gist.github.com/kost/017e95aa24f454f77a37>
