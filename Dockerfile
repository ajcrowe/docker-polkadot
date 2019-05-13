# Build polkadot binary
FROM rust:1.34 as builder

LABEL maintainer="Alex Crowe <alex@ajcrowe.io>"

ARG GIT_REF=master

RUN apt-get update && \
    apt-get upgrade -y && \
    apt install -qy make clang pkg-config libssl-dev

WORKDIR /tmp/polkadot

RUN git clone --branch $GIT_REF https://github.com/paritytech/polkadot.git . && \
    ./scripts/init.sh && \
    ./scripts/build.sh && \
    cargo install --path ./ polkadot

# Build minimal runtime container
FROM debian:stretch-slim

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy libssl1.1 ca-certificates locales && \
    rm -rf /var/lib/apt/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

# set the --base-path to default
ENV BASE_PATH "/usr/share/polkadot"

RUN useradd -md /usr/share/polkadot polkadot

COPY --from=builder  /usr/local/cargo/bin/polkadot /usr/local/bin/

ADD run.sh /run.sh

USER polkadot

EXPOSE 30333 9933 9944

VOLUME ["/usr/share/polkadot"]

ENTRYPOINT ["/run.sh"]
