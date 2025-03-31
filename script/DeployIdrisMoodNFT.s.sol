// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import {Script, console} from "forge-std/Script.sol";
import {IdrisMoodNFT} from "src/IdrisMoodNFT.sol";
import {Base64} from "lib/openzeppelin-contracts/contracts/utils/Base64.sol";

contract DeployIdrisMoodNFT is Script {
    function run() external returns (IdrisMoodNFT){
        string memory sadSvg = vm.readFile("img/sad.svg");
        string memory happySvg = vm.readFile("img/happy.svg");

        vm.startBroadcast();
        IdrisMoodNFT moodNFT = new IdrisMoodNFT(svgImageURI(sadSvg),svgImageURI(happySvg));
        vm.stopBroadcast();
        return moodNFT;

    }

    function svgImageURI(string memory svg) public pure returns (string memory){
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
        return string (abi.encodePacked(baseURL, svgBase64Encoded));
    }

}