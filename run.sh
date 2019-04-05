#!/bin/bash

# Build Flags
flags=( 
	'POLKADOT_ENABLE_DEV,--dev'
	'POLKADOT_ENABLE_LIGHTCLIENT,--light'
	'POLKADOT_FORCE_AUTHORING,--force-authoring'
	'POLKADOT_NO_GRANDPA,--no-grandpa'
	'POLKADOT_NO_TELEMETRY,--no-telelmetry'
	'POLKADOT_NO_MDNS,--no-mdns'
	'POLKADOT_RPC_EXTERNAL,--rcp-external'
	'POLKADOT_TELEMETRY,--telemetry'
	'POLKADOT_VALIDATOR,--validator'
	'POLKADOT_WS_EXTERNAL,--ws-external'
)

for v in ${flags[@]}; do
	env=$(echo $v | cut -d',' -f1)
	flag=$(echo $v | cut -d',' -f2)
	[ x${!env} != "x" ] && params="$params ${flag}"
done

options=(
	'POLKADOT_BASE_PATH,--base-path'
	'POLKADOT_BLOCK_CONSTRUCTION_EXECUTION,--block-construction-execution'
	'POLKADOT_BOOTNODES,--bootnodes'
	'POLKADOT_CHAIN,--chain'
	'POLKADOT_DB_CACHE,--db-cache'
	'POLKADOT_EXECUTION,--execution'
	'POLKADOT_IMPORTING_EXECUTION,--importing-execution'
	'POLKADOT_IN_PEERS,--in-peers'
	'POLKADOT_IN_PEERS,--in-peers'
	'POLKADOT_KEY,--key'
	'POLKADOT_KEYSTORE_PATH,--keystore-path'
	'POLKADOT_LISTEN_ADDR,--listen-addr'
	'POLKADOT_LOG,--log'
	'POLKADOT_MAX_HEAP_PAGES,--max-heap-pages'
	'POLKADOT_MIN_HEAP_PAGES,--min-heap-pages'
	'POLKADOT_NAME,--name'
	'POLKADOT_NODE_KEY,--node-key'
	'POLKADOT_NODE_KEY_FILE,--node-key-file'
	'POLKADOT_NODE_KEY_TYPE,--node-key-type'
	'POLKADOT_OFFCHAIN_WORKER,--offchain-worker'
	'POLKADOT_OFFCHAIN_WORKER_EXECUTION,--offchain-worker-execution'
	'POLKADOT_OTHER_EXECUTION,--other-execution'
	'POLKADOT_OUT_PEERS,--out-peers'
	'POLKADOT_POOL_KBYTES,--pool-kbytes'
	'POLKADOT_POOL_LIMIT,--pool-limit'
	'POLKADOT_PORT,--port'
	'POLKADOT_PRUNING,--pruning'
	'POLKADOT_RESERVED_NODES,--reserved-nodes'
	'POLKADOT_RPC_PORT,--rpc-port'
	'POLKADOT_SYNCING_EXECUTION,--syncing-execution'
	'POLKADOT_TELEMETRY_URL,--telemetry-url'
	'POLKADOT_WS_PORT,--ws-port'
)

for v in ${options[@]}; do
	env=$(echo $v | cut -d',' -f1)
	option=$(echo $v | cut -d',' -f2)
	[ x${!env} != "x" ] && params="$params $option ${!env}"
done

/usr/local/bin/polkadot $params $@
