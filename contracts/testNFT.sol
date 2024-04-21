// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract ScalingETHNFT is ERC721URIStorage, Ownable {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    string private _baseTokenUri;

    constructor(string memory collectionName, string memory symbol)  ERC721(collectionName, symbol) {
    }

    function setBaseURI(string memory baseURI) external onlyOwner{
        _baseTokenUri = baseURI;
    }

    function mintNFT() public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, _baseTokenUri);
        return newItemId;
    }

}