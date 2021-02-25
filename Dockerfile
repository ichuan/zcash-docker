FROM debian:9

WORKDIR /opt/coin

RUN apt-get update && apt-get install -y wget python
RUN wget https://z.cash/downloads/zcash-4.2.0-linux64-debian-stretch.tar.gz -O - | tar --strip-components 1 -C /opt/coin -xzf -

# cleanup
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/opt/coin/bin/zcashd"]
CMD ["-conf=/opt/coin/coin.conf"]
