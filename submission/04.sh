# Which public key signed input 0 in this tx: d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7

# Get the transaction details
TX_ID="d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7"

# Get the transaction with detailed information
TX_INFO=$(bitcoin-cli -signet getrawtransaction $TX_ID 2)

# echo $TX_INFO

# For SegWit transactions, the signature and public key are in txinwitness
# The public key is typically the second element in the witness stack
PUBLIC_KEY=$(echo $TX_INFO | jq -r '.vin[0].txinwitness[1]')

echo $PUBLIC_KEY