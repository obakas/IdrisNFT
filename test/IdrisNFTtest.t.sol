// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {DeployIdrisNFT} from "script/DeployIdrisNFT.s.sol";
import {IdrisNFT} from "src/IdrisNFT.sol";

contract IdrisNFTtest is Test{
    DeployIdrisNFT public deployer;
    IdrisNFT public idrisNFT;
    address public USER = makeAddr("user");
    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployIdrisNFT();
        idrisNFT = deployer.run();
    }

    function testNameIsCorrect() public view{
        string memory expectedName = "Dogie";
        string memory actualName = idrisNFT.name();
        // assertEq(expectedName, actualName);
        assert(
            keccak256(abi.encodePacked(expectedName)) == 
            keccak256(abi.encodePacked(actualName))
            );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        idrisNFT.mintNFT(PUG);

        assert(idrisNFT.balanceOf(USER)== 1);
        assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(idrisNFT.tokenURI(0))));
    }
}