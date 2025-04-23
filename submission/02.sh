# How many new outputs were created by block 243,825?
# Get block hash
BLOCK_HASH=$(bitcoin-cli -signet getblockhash 243825)

# echo $BLOCK_HASH

# Get block details with transaction information
bitcoin-cli -signet getblock $BLOCK_HASH 2 | jq '[.tx[].vout[]] | length'

