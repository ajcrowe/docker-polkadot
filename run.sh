#!/bin/bash

# Build Flags
flags=( 
	'POLKADOT_ENABLE_DEV,--dev'
	'POLKADOT_ENABLE_LIGHTCLIENT,--light'
	'POLKADOT_NO_TELEMETRY,--no-telelmetry'
	'POLKADOT_TELEMETRY,--telemetry'
	'POLKADOT_VALIDATOR,--validator'
	'POLKADOT_RPC_EXTERNAL,--rcp-external'
	'POLKADOT_WS_EXTERNAL,--ws-external'
)

for v in ${flags[@]}; do
	env=$(echo $v | cut -d',' -f1)
	flag=$(echo $v | cut -d',' -f2)
	[ x${!env} != "x" ] && params="$params ${flag}"
done

options=(
	'POLKADOT_BASE_PATH,--base-path'
	'POLKADOT_BOOTNODES,--bootnodes'
	'POLKADOT_CHAIN,--chain'
	'POLKADOT_DB_CACHE,--db-cache'
	'POLKADOT_EXECUTION,--execution'
	'POLKADOT_IN_PEERS,--in-peers'
	'POLKADOT_KEY,--key'
	'POLKADOT_KEYSTORE_PATH,--keystore-path'
	'POLKADOT_LISTEN_ADDR,--listen-addr'
	'POLKADOT_LOG,--log'
	'POLKADOT_MAX_HEAP_PAGES,--max-heap-pages'
	'POLKADOT_MIN_HEAP_PAGES,--min-heap-pages'
	'POLKADOT_NAME,--name'
	'POLKADOT_NODE_KEY,--node-key'
	'POLKADOT_PORT,--port'
	'POLKADOT_PRUNING,--pruning'
	'POLKADOT_RESERVED_NODES,--reserved-nodes'
	'POLKADOT_RPC_PORT,--rpc-port'
	'POLKADOT_TELEMETRY_URL,--telemetry-url'
	'POLKADOT_WS_PORT,--ws-port'
)

for v in ${options[@]}; do
	env=$(echo $v | cut -d',' -f1)
	option=$(echo $v | cut -d',' -f2)
	[ x${!env} != "x" ] && params="$params $option ${!env}"
done

/usr/local/bin/polkadot $params $@
