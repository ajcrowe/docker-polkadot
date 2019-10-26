#!/bin/bash

set -e

# Runtime Flags
flags=( 
	'POLKADOT_DEV,--dev'
	'POLKADOT_LIGHT,--light'
	'POLKADOT_FORCE_AUTHORING,--force-authoring'
	'POLKADOT_NO_GRANDPA,--no-grandpa'
	'POLKADOT_NO_TELEMETRY,--no-telelmetry'
	'POLKADOT_NO_MDNS,--no-mdns'
	'POLKADOT_PASSWORD_INTERACTIVE,--password-interactive'
	'POLKADOT_RESERVED_ONLY,--reserved-only'
	'POLKADOT_RPC_EXTERNAL,--rpc-external'
	'POLKADOT_UNSAFE_PRUNING,--unsafe-pruning'
	'POLKADOT_VALIDATOR,--validator'
	'POLKADOT_WS_EXTERNAL,--ws-external'
)

for v in ${flags[@]}; do
	env=$(echo $v | cut -d',' -f1)
	flag=$(echo $v | cut -d',' -f2)
	[ x${!env} != "x" ] && params="$params ${flag}"
done

# Runtime Options
options=(
	'POLKADOT_BASE_PATH,--base-path'
	'POLKADOT_BOOTNODES,--bootnodes'
	'POLKADOT_CHAIN,--chain'
	'POLKADOT_DB_CACHE,--db-cache'
	'POLKADOT_EXECUTION,--execution'
    'POLKADOT_EXECUTION_BLOCK_CONSTRUCTION,--execution-block-construction'
    'POLKADOT_EXECUTION_IMPORT_BLOCK,--execution-import-block'
    'POLKADOT_EXECUTION_OFFCHAIN_WORKER,--execution-offchain-worker'
    'POLKADOT_EXECUTION_OTHER,--execution-other'
    'POLKADOT_EXECUTION_SYNCING,--execution-syncing'
	'POLKADOT_IN_PEERS,--in-peers'
	'POLKADOT_KEYSTORE_PATH,--keystore-path'
	'POLKADOT_LISTEN_ADDR,--listen-addr'
	'POLKADOT_LOG,--log'
	'POLKADOT_NAME,--name'
	'POLKADOT_NODE_KEY,--node-key'
	'POLKADOT_NODE_KEY_FILE,--node-key-file'
	'POLKADOT_NODE_KEY_TYPE,--node-key-type'
	'POLKADOT_OFFCHAIN_WORKER,--offchain-worker'
	'POLKADOT_OUT_PEERS,--out-peers'
	'POLKADOT_PASSWORD,--password'
	'POLKADOT_PASSWORD_FILENAME,--password-filename'
	'POLKADOT_POOL_KBYTES,--pool-kbytes'
	'POLKADOT_POOL_LIMIT,--pool-limit'
	'POLKADOT_PORT,--port'
	'POLKADOT_PRUNING,--pruning'
	'POLKADOT_RESERVED_NODES,--reserved-nodes'
	'POLKADOT_RPC_CORS,--rpc-cors'
	'POLKADOT_RPC_PORT,--rpc-port'
	'POLKADOT_STATE_CACHE_SIZE,--state-cache-size'
	'POLKADOT_TELEMETRY_URL,--telemetry-url'
	'POLKADOT_WASM_EXECUTION,--wasm-execution'
	'POLAKDOT_WS_MAX_CONNECTIONS,--ws-max-connections'
	'POLKADOT_WS_PORT,--ws-port'
)

for v in ${options[@]}; do
	env=$(echo $v | cut -d',' -f1)
	option=$(echo $v | cut -d',' -f2)
	[ x${!env} != "x" ] && params="$params $option ${!env}"
done

/usr/local/bin/polkadot $params $@
