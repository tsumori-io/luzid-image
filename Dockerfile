FROM --platform=linux/amd64 debian:bookworm-slim

ARG LUZID_RELEASE=v0.1.2

ENV LUZID_DOWNLOAD_ROOT="https://github.com/luzid-app/luzid-sdk/releases/download"
ENV LUZID_BINARY_URL="${LUZID_DOWNLOAD_ROOT}/linux-${LUZID_RELEASE}/luzid.tar.gz"

RUN apt-get update && apt-get install -y curl tini

RUN curl -SfL "${LUZID_BINARY_URL}" -o /tmp/luzid.tar.gz && \
    tar -xzf /tmp/luzid.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/luzid && \
    rm /tmp/luzid.tar.gz

RUN apt-get remove -y curl && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 60061

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/local/bin/docker-entrypoint.sh"]
