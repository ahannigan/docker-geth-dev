FROM ethereum/client-go:latest

RUN apt-get update && apt-get install -y --no-install-recommends solc bootnode && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /entrypoint.sh

ENV ETH_DIR /root/.ethereum

RUN mkdir $ETH_DIR
COPY data/ $ETH_DIR/
COPY mine_when_needed.js /mine_when_needed.js

VOLUME $ETH_DIR

ENTRYPOINT ["/entrypoint.sh"]
