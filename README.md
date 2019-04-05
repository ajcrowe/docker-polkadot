Polkadot Docker
===============

This builds the [Parity Polkadot](https://github.com/paritytech/polkadot.git) node.

All images are built with [Google Cloud Build] and are triggered automatically from any pushed tags.

## Images

You can view available images on the [Docker Hub](https://hub.docker.com/ajcrowe/polkadot)

## Usage

This image support both passing args directly to the image or setting envrionment variables (see below).

```
docker run -e "POLKADOT_ENABLE_DEV=true" -e "POLKADOT_BASE_PATH=/data" ajcrowe/polkadot --no-telelmetry
```

## Building

To build the container you simply need to pass in the git reference you want to build

```
docker build -t user/polkadot:v0.4.0 --build-arg GIT_REF=v0.4.0 .
```

## Environment Variables

You can pass a number environment variables to configure the node

_Note: Prior to v0.3.0 environment variables were not prefixed with `POLKADOT_`_

### Flags

| Environment Variable          | Flag                | Description                                                                                          |
|-------------------------------|---------------------|------------------------------------------------------------------------------------------------------|
| `POLKADOT_ENABLE_DEV`         | `--dev`             | Run in development mode; implies --chain=dev --validator --key Alice                                 |
| `POLKADOT_ENABLE_LIGHTCLIENT` | `--light`           | Run in light client mode                                                                             |
| `POLKADOT_FORCE-AUTHORING`    | `--force-authoring` | Enable authoring even when offline.                                                                  |
| `POLKADOT_NO-GRANDPA`         | `--no-grandpa`      | Disable GRANDPA when running in validator mode                                                       |
| `POLKADOT_NO_MDNS`            | `--no-mdns`         | By default, the network will use mDNS to discover other nodes on the local network. This disables it |
| `POLKADOT_NO_TELEMETRY`       | `--no-telelmetry`   | Should not connect to the Polkadot telemetry server (telemetry is on by default on global chains)    |
| `POLKADOT_TELEMETRY`          | `-t --telemetry`    | Listen to all RPC interfaces (default is local)                                                      |
| `POLKADOT_VALIDATOR`          | `--validator`       | Enablevalidator mode                                                                                 |
| `POLKADOT_RPC_EXTERNAL`       | `--rcp-external`    | Listen to all RPC interfaces (default is local)                                                      |
| `POLKADOT_WS_EXTERNAL`        | `--ws-external`     | Listen to all Websocket interfaces (default is local)                                                |

### Options

| Environment Variable                    | Flag                             | Description                                                                                                    |
|-----------------------------------------|----------------------------------|----------------------------------------------------------------------------------------------------------------|
| `POLKADOT_BASE_PATH`                    | `-d --base-path`                 | Specify custom base path                                                                                       |
| `POLKADOT_BLOCK_CONSTRUCTION_EXECUTION` | `--block-construction-execution` |                                                                                                                |
| `POLKADOT_BOOTNODES`                    | `--bootnodes`                    | Specify a list of bootnodes                                                                                    |
| `POLKADOT_CHAIN`                        | `--chain`                        | Specify the chain specification (one of krummelanke, dev, local or staging)                                    |
| `POLKADOT_DB_CACHE`                     | `--db-cache`                     | Limit the memory the database cache can use                                                                    |
| `POLKADOT_EXECUTION`                    | `--execution`                    | The means of execution used when calling into the runtime. Can be either wasm, native or both.                 |
| `POLKADOT_IMPORTING_EXECUTION`          | `--importing-execution`          | The means of execution used when calling into the runtime while importing blocks                               |
| `POLKADOT_IN_PEERS`                     | `--in-peers`                     | Specify the maximum number of incoming connections we're accepting                                             |
| `POLKADOT_IN_PEERS`                     | `--in-peers`                     | Specify the maximum number of incoming connections we're accepting [default: 25]                               |
| `POLKADOT_KEY`                          | `--key`                          | Specify additional key seed                                                                                    |
| `POLKADOT_KEYSTORE_PATH`                | `--keystore-path`                | Specify custom keystore path                                                                                   |
| `POLKADOT_LISTEN_ADDR`                  | `--listen-addr`                  | Listen on this multiaddress                                                                                    |
| `POLKADOT_LOG`                          | `-l --log`                       | Sets a custom logging filter                                                                                   |
| `POLKADOT_MAX_HEAP_PAGES`               | `--max-heap-pages`               | The maximum number of 64KB pages to ever allocate for Wasm execution. Don't                                    |
| `POLKADOT_MIN_HEAP_PAGES`               | `--min-heap-pages`               | The number of 64KB pages to allocate for Wasm execution initially.                                             |
| `POLKADOT_NAME`                         | `--name`                         | The human-readable name for this node, as reported to the telemetry server, if enabled                         |
| `POLKADOT_NODE_KEY_FILE`                | `--node-key-file`                | The file from which to read the node's secret key to use for libp2p networking                                 |
| `POLKADOT_NODE_KEY_TYPE`                | `--node-key-type`                | The type of secret key to use for libp2p networking                                                            |
| `POLKADOT_NODE_KEY`                     | `--node-key`                     | Specify node secret key (64-character hex string)                                                              |
| `POLKADOT_OFFCHAIN_WORKER_EXECUTION`    | `--offchain-worker-execution`    | Should execute offchain workers on every block                                                                 |
| `POLKADOT_OFFCHAIN_WORKER`              | `--offchain-worker`              | The means of execution used when calling into the runtime while constructing blocks                            |
| `POLKADOT_OTHER_EXECUTION`              | `--other-execution`              | The means of execution used when calling into the runtime while not syncing, importing or constructing blocks. |
| `POLKADOT_OUT_PEERS`                    | `--out-peers`                    | Specify the number of outgoing connections we're trying to maintain                                            |
| `POLKADOT_POOL_KBYTES`                  | `--pool-kbytes`                  | Maximum number of kilobytes of all transactions stored in the pool                                             |
| `POLKADOT_POOL_LIMIT`                   | `--pool-limit`                   | Maximum number of transactions in the transaction pool                                                         |
| `POLKADOT_PORT`                         | `--port`                         | Specify p2p protocol TCP port                                                                                  |
| `POLKADOT_PRUNING`                      | `--pruning`                      | Specify the pruning mode, a number of blocks to keep or "archive". Default is 256.                             |
| `POLKADOT_RESERVED_NODES`               | `--reserved-nodes`               | Specify a list of reserved node addresses                                                                      |
| `POLKADOT_RPC_PORT`                     | `--rpc-port`                     | Specify HTTP RPC server TCP port                                                                               |
| `POLKADOT_SYNCING_EXECUTION`            | `--syncing-execution`            | The means of execution used when calling into the runtime while syncing blocks                                 |
| `POLKADOT_TELEMETRY_URL`                | `--telemetry-url`                | The URL of the telemetry server. Implies --telemetry                                                           |
| `POLKADOT_WS_PORT`                      | `--ws-port`                      | Specify WebSockets RPC server TCP port                                                                         |
