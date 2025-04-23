# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb

# Get the transaction details
TX_ID="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"

# Get the transaction with detailed information
TX_INFO=$(bitcoin-cli -signet getrawtransaction $TX_ID 2)

# echo $TX_INFO

# Extract the fee directly from the transaction info (in BTC)
FEE_BTC=$(echo $TX_INFO | jq -r '.fee')

# Convert BTC to satoshis using jq directly
FEE_SATOSHIS=$(echo $TX_INFO | jq -r '.fee * 100000000 | floor')

echo "$FEE_SATOSHIS"