# what is the coinbase tx in this block 243,834

# Get block hash for block 243,834
BLOCK_HASH=$(bitcoin-cli -signet getblockhash 243834)

# Get block details with transaction information
BLOCK_DATA=$(bitcoin-cli -signet  getblock $BLOCK_HASH 2)

# The coinbase transaction is always the first transaction in a block
COINBASE_TX=$(echo $BLOCK_DATA | jq -r '.tx[0].txid')

echo "$COINBASE_TX"