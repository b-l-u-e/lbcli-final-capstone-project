# Which tx in block 216,351 spends the coinbase output of block 216,128?
# Get coinbase transaction of block 216,128
BLOCK_HASH_216128=$(bitcoin-cli -signet getblockhash 216128)
COINBASE_TX=$(bitcoin-cli -signet getblock $BLOCK_HASH_216128 2 | jq -r '.tx[0].txid')

# echo "Coinbase transaction from block 216,128: $COINBASE_TX"

# Now get transactions from block 216,351 and check which one spends the coinbase output
BLOCK_HASH_216351=$(bitcoin-cli -signet getblockhash 216351)

# Find the transaction that spends the coinbase output
SPENDING_TX=$(bitcoin-cli -signet getblock $BLOCK_HASH_216351 2 | \
  jq -r --arg coinbase "$COINBASE_TX" '.tx[] | select(.vin[].txid == $coinbase) | .txid')

echo $SPENDING_TX