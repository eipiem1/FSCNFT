output=`cast call $NFT_CA "tokenURI(uint256)" 1 --private-key $PRIVATE_KEY --rpc-url $RPC_URL`

cast abi-decode "function tokenURI(uint256) returns (string)" $output
