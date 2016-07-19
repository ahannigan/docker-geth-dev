FROM ethereum/client-go:latest

RUN apt-get update && apt-get install -y --no-install-recommends bootnode && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /entrypoint.sh
COPY boot.key /boot.key

EXPOSE 30301
ENTRYPOINT ["/entrypoint.sh"]
