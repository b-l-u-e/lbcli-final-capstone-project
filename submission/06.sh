# Only one tx in block 243,821 signals opt-in RBF. What is its txid?

# Get block hash for block 243,821
BLOCK_HASH=$(bitcoin-cli -signet getblockhash 243821)

# Get block details with transaction information
BLOCK_DATA=$(bitcoin-cli -signet  getblock $BLOCK_HASH 2)

# Find transactions that signal opt-in RBF
# A transaction signals opt-in RBF if any of its inputs has a sequence number less than 0xffffffff-1 (4294967294)
# We'll use jq to find such transactions
RBF_TX=$(echo $BLOCK_DATA | jq -r '
  .tx[] | 
  select(
    .vin[] | 
    .sequence < 4294967294
  ) | 
  .txid
')

echo "$RBF_TX"