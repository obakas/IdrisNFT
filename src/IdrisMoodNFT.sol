// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Base64} from "lib/openzeppelin-contracts/contracts/utils/Base64.sol";

contract IdrisMoodNFT is ERC721 {
    error IdrisMoodNFT__CantFlipMoodIfNotOwner();

    uint256 private s_tokenCounter;
    string private s_sadSvgUri;
    string private s_happySvgUri;

    enum Mood{
        HAPPY,
        SAD
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(string memory sadSVG, string memory happySVG) ERC721 ("Mood NFT","MN"){
        s_tokenCounter = 0;
        s_sadSvgUri = sadSVG;
        s_happySvgUri = happySVG;
    }

    function mintNFT() public{
        // uint256 tokenCounter = s_tokenCounter;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.SAD;
        s_tokenCounter++;
    }

    function flipMood(uint256 tokenId) public {
        if(ownerOf(tokenId) != msg.sender){
            revert IdrisMoodNFT__CantFlipMoodIfNotOwner();
        }
        if(s_tokenIdToMood[tokenId] == Mood.HAPPY){
            s_tokenIdToMood[tokenId] = Mood.SAD;
        }else{
            s_tokenIdToMood[tokenId] = Mood.HAPPY;
        }
    }

    function _baseURI() internal pure override returns(string memory){
        return "data: image/svg+xml;base64, ";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory){
        string memory imageURI;

        if (s_tokenIdToMood[tokenId] == Mood.HAPPY){
            imageURI = s_happySvgUri;
        }else {
            imageURI = s_sadSvgUri;
        }

       return 
       string(
        abi.encodePacked(
            _baseURI(), Base64.encode(bytes(
                abi.encodePacked(
                    '{"name": "', name(), '", "description": "An NFT that reflects the owners mood. ", "attributes": [{"trait_type":"moodiness","value": 100}],"image": "', imageURI,'"}')
        )))
        );
    }

        function getHappySVG() public view returns (string memory) {
        return s_happySvgUri;
    }

    function getSadSVG() public view returns (string memory) {
        return s_sadSvgUri;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
    
}