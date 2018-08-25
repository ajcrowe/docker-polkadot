# Build polkadot binary
FROM rust:1.28 as builder

LABEL maintainer="Alex Crowe <alex@ajcrowe.io>"

ARG GIT_REF=master

RUN apt-get update && \
    apt-get upgrade -y && \
    apt install -qy make clang pkg-config libssl-dev

RUN cargo install --git https://github.com/paritytech/substrate.git --rev $GIT_REF polkadot

# Build minimal runtime container
FROM debian:stretch-slim

RUN apt-get update && \
    apt install -qy libssl1.1 ca-certificates && \
    rm -rf /var/lib/apt/*

# set the --base-path to default
ENV BASE_PATH="/usr/share/polkadot"

RUN useradd -md /usr/share/polkadot polkadot

COPY --from=builder  /usr/local/cargo/bin/polkadot /usr/local/bin/

ADD run.sh /run.sh

USER polkadot

EXPOSE 30333 9933 9944

VOLUME ["/usr/share/polkadot"]

ENTRYPOINT ["/run.sh"]
