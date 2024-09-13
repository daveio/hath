# daveio/hath

![Docker Pulls](https://img.shields.io/docker/pulls/daveio/hath.svg)

![Docker Stars](https://img.shields.io/docker/stars/daveio/hath.svg)

## Usage

```shell
docker run \
  --name hath \
  --user 1000:1000 \
  -v hathCache:/hath/cache \
  -v hathData:/hath/data \
  -v hathDownload:/hath/download \
  -v hathLog:/hath/log \
  -v hathTmp:/hath/tmp \
  -e HATH_CLIENT_ID=YOUR_HATH_CLIENT_ID \
  -e HATH_CLIENT_KEY=YOUR_HATH_CLIENT_KEY \
  -e UMASK=000 \
  -e TZ=Europe/London \
  -p 443/tcp \
  daveio/hath
```

If bridge neteworking doesn't work on your Docker host for some reason, try `--net host`.
