// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {IdrisNFT} from "src/IdrisNFT.sol";


contract MintIdrisNFT is Script{
    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external{
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("IdrisNFT", block.chainid);
        mintNFTOnContract(mostRecentlyDeployed);
    }

    function mintNFTOnContract(address contractAddress) public {
        vm.startBroadcast();
        IdrisNFT(contractAddress).mintNFT(PUG);
        vm.stopBroadcast();
    }
}