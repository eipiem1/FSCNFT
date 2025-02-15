#forge create --legacy --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY src/FSCNFT.sol:FSCNFT -v --constructor-args "FSCNFT" "FSCNFT" "https://arweave.net/"
forge create --legacy --rpc-url $RPC_URL --private-key $PRIVATE_KEY src/FSCNFT.sol:FSCNFT -v --constructor-args "FSCNFT" "FSCNFT" "https://arweave.net/"
