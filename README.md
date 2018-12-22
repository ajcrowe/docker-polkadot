Polkadot Docker
===============

This builds the [Parity Polkadot](https://github.com/paritytech/polkadot.git) node.

All images are built with [Google Cloud Build] and are triggered automatically from any pushed tags.

## Images

You can view available images on the [Docker Hub](https://hub.docker.com/ajcrowe/polkadot)

## Usage

This image support both passing args directly to the image or setting envrionment variables (see below).

```
docker run -e "ENABLE_DEV=true" -e "BASE_PATH=/data" ajcrowe/polkadot
```

## Building

To build the container you simply need to pass in the git reference you want to build

```
docker build -t user/polkadot:v0.3.0 --build-arg GIT_REF=v0.3.0 .
```

## Environment Variables

You can pass a number environment variables to configure the node

### Flags

| Environment Variable | Flag               | Description                                                                                       |
| -------------------- | ------------------ | ------------------------------------------------------------------------------------------------- |
| `ENABLE_DEV`         | `--dev`            | Run in development mode; implies --chain=dev --validator --key Alice                              |
| `ENABLE_LIGHTCLIENT` | `--light`          | Run in light client mode                                                                          |
| `NO_TELEMETRY`       | `--no-telelmetry`  | Should not connect to the Polkadot telemetry server (telemetry is on by default on global chains) |
| `TELEMETRY`          | `-t --telemetry`   | Listen to all RPC interfaces (default is local)                                                   |
| `VALIDATOR`          | `--validator`      | Enablevalidator mode                                                                              |
| `RPC_EXTERNAL`       | `--rcp-external`   | Listen to all RPC interfaces (default is local)                                                   |
| `WS_EXTERNAL`        | `--ws-external`    | Listen to all Websocket interfaces (default is local)                                             |

### Options

| Environment Variable | Flag               | Description                                                                                       |
| -------------------- | ------------------ | ------------------------------------------------------------------------------------------------- |
| `BASE_PATH`          | `-d --base-path`   | Specify custom base path                                                                          |
| `BOOTNODES`          | `--bootnodes`      | Specify a list of bootnodes                                                                       |
| `CHAIN`              | `--chain`          | Specify the chain specification (one of krummelanke, dev, local or staging)                       |
| `EXECUTION`          | `--execution`      | The means of execution used when calling into the runtime. Can be either wasm, native or both.    |
| `KEY`                | `--key`            | Specify additional key seed                                                                       |
| `KEYSTORE_PATH`      | `--keystore-path`  | Specify custom keystore path                                                                      |
| `LOG`                | `-l --log`         | Sets a custom logging filter                                                                      |
| `MAX_HEAP_PAGES`     | `--max-heap-pages` | The maximum number of 64KB pages to ever allocate for Wasm execution. Don't                       |
| `MIN_HEAP_PAGES`     | `--min-heap-pages` | The number of 64KB pages to allocate for Wasm execution initially.                                |
| `NAME`               | `--name`           | The human-readable name for this node, as reported to the telemetry server, if enabled            |
| `NODE_KEY`           | `--node-key`       | Specify node secret key (64-character hex string)                                                 |
| `PORT`               | `--port`           | Specify p2p protocol TCP port                                                                     |
| `PRUNING`            | `--pruning`        | Specify the pruning mode, a number of blocks to keep or "archive". Default is 256.                |
| `RESERVED_NODES`     | `--reserved-nodes` | Specify a list of reserved node addresses                                                         |
| `RPC_PORT`           | `--rpc-port`       | Specify HTTP RPC server TCP port                                                                  |
| `WS_PORT`            | `--ws-port`        | Specify WebSockets RPC server TCP port                                                            |
| `TELEMETRY_URL`      | `--telemetry-url`  | The URL of the telemetry server. Implies --telemetry                                              |
