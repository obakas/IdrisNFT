// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract IdrisNFT is ERC721{
    uint256 private s_tokenCounter;
    mapping (uint256  => string) private s_tokenIdToUri;

    constructor() ERC721("Dogie", "DOG"){
        s_tokenCounter = 0;
    }


    function mintNFT(string memory newTokenURI) public{
        s_tokenIdToUri[s_tokenCounter] = newTokenURI;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override (ERC721) returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}