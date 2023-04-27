FROM alpine:3.9 as base

RUN apk add --no-cache jq curl

ENV GHR_FORK tcnksm/ghr
ENV GHR_VERSION 0.13.0

SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN curl -s -L https://github.com/${GHR_FORK}/releases/download/v${GHR_VERSION}/ghr_v${GHR_VERSION}_linux_amd64.tar.gz > ghr.tar.gz && \ 
    tar xzf ghr.tar.gz && \
    mv ghr_v*_linux_amd64/ghr /usr/local/bin && \
    rm -rf ghr* && \

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
