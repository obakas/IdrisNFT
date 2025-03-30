// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import {Script} from "forge-std/Script.sol";
import {IdrisNFT} from "src/IdrisNFT.sol";

contract DeployIdrisNFT is Script {
    function run() external returns (IdrisNFT) {
        vm.startBroadcast();
        IdrisNFT idrisNFT = new IdrisNFT();
        vm.stopBroadcast();
        return idrisNFT;
    }
}