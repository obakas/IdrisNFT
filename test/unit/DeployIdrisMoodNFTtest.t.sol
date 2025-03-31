// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {DeployIdrisMoodNFT} from "script/DeployIdrisMoodNFT.s.sol";

contract DeployIdrisMoodNFTtest is Test {
    DeployIdrisMoodNFT public deployer;

    function setUp() public{
        deployer = new DeployIdrisMoodNFT();
    }

    // function testConvertSvgToUri() public view {
    //     string memory expectedUri = "data: image/svg+xml;base64, PHN2ZyBoZWlnaHQ9IjIyMCIgd2lkdGg9IjUwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8cG9seWdvbiBwb2ludHM9IjEwMCwxMCAxNTAsMTkwIDUwLDE5MCIgc3R5bGU9ImZpbGw6bGltZTtzdHJva2U6cHVycGxlO3N0cm9rZS13aWR0aDozIiAvPgo8L3N2Zz4=";
    //     string memory svg = '<svg height="220" width="500" xmlns="http://www.w3.org/2000/svg"> <polygon points="100,10 150,190 50,190" style="fill:lime;stroke:purple;stroke-width:3" /></svg>';
    //     string memory actualUri = deployer.svgImageURI(svg);
    //     assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));
    // }

    

}