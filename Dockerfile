FROM openjdk:24-slim

LABEL maintainer Dave W <dave@dave.io>

ARG HATH_VERSION

RUN apt-get update && apt-get install -y --no-install-recommends wget=1.21.3-1+b1 unzip=6.0-28 && \
    wget --progress=dot:giga -O /tmp/hath-$HATH_VERSION.zip https://repo.e-hentai.org/hath/HentaiAtHome_$HATH_VERSION.zip && \
    ls -l /tmp && \
    mkdir -p /opt/hath /hath && \
    unzip /tmp/hath-$HATH_VERSION.zip -d /opt/hath && \
    rm /tmp/hath-$HATH_VERSION.zip && \
    apt-get remove -y wget unzip && rm -rf /var/lib/apt/lists/*

COPY run/start.sh /opt/hath/

RUN chmod +x /opt/hath/start.sh

VOLUME ["/hath/cache", "/hath/data", "/hath/download", "/hath/log", "/hath/tmp"]

CMD ["/opt/hath/start.sh"]
