# what block height was this tx mined ?
# 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb

# Define the transaction ID
TX_ID="49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb"

# Get the transaction details
TX_INFO=$(bitcoin-cli -signet getrawtransaction $TX_ID 2)

# Extract the block hash from the transaction info
BLOCK_HASH=$(echo $TX_INFO | jq -r '.blockhash')

# Get the block details to find its height
BLOCK_HEIGHT=$(bitcoin-cli -signet getblock $BLOCK_HASH | jq -r '.height')

# Output the block height
echo $BLOCK_HEIGHT