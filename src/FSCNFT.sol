// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "solmate/tokens/ERC721.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

error MintPriceNotPaid();
error MaxSupply();
error NonExistentTokenURI();

contract FSCNFT is ERC721,Ownable {
    using Strings for uint256;
    string public baseURI;
    uint256 public currentTokenId;

    uint256 public constant MAX_CAPACITY = 21_000_000;
    uint256 public constant MINT_PRICE = 0.001 ether;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _baseURI
    ) ERC721(_name, _symbol) Ownable(msg.sender) {
			  baseURI = _baseURI;
    }

    function mintTo(address recipient) public payable returns (uint256) {
        if (msg.value != MINT_PRICE) {
            revert MintPriceNotPaid();
        }
        uint256 newItemId = ++currentTokenId;
        if (newItemId > MAX_CAPACITY) {
            revert MaxSupply();
        }
        _safeMint(recipient, newItemId);
        return newItemId;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        if (ownerOf(tokenId) == address(0)) {
            revert NonExistentTokenURI();
        }
        
        if(bytes(baseURI).length > 0){
            return string(abi.encodePacked(baseURI, tokenId.toString()));
        }
        else{
            return "";
        }
    }
}
