// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {console} from "forge-std/console.sol";

import {NFTBridgePass} from "../NFTBridgePass.sol";

// vm with cheatcodes
import {Vm} from "forge-std/Vm.sol";

contract NFTBridgePassScript {
    /// @notice hevm
    Vm constant vm =
        Vm(address(bytes20(uint160(uint256(keccak256("hevm cheat code"))))));

    function run() external {
        vm.deal(address(this), 2 ether);

        // Optimism's Kovan Bridge address
        address l2BridgeToken = address(
            0x22F24361D548e5FaAfb36d1437839f080363982B
        );

        NFTBridgePass nftBridgePass = new NFTBridgePass(
            l2BridgeToken,
            2,
            "https://l2-invite.vercel.app/?",
            "devs do something?",
            "ipfs://bafkreihitm7yae6xkhsdgi5ekkhxmc6vsls3kcz7jr72vzggjq5jr2hm3a"
        );

        uint32 l2Gas = 1300000;

        uint256 tokenId = nftBridgePass.mint{value: 1 ether}(
            address(this),
            l2Gas
        );

        console.logString("tokenId:");
        console.logUint(tokenId);
        console.logString("tokenURI:");
        console.logString(nftBridgePass.tokenURI(1));

        console.logString("name:");
        console.logString(nftBridgePass.name());
        console.logString("symbol:");
        console.logString(nftBridgePass.symbol());
        console.logString("symbol:");
        console.logString(nftBridgePass.symbol());

        tokenId = nftBridgePass.mint{value: 1 ether}(address(this), l2Gas);
        console.logString("tokenId:");
        console.logUint(tokenId);
        console.logString("tokenURI:");
        console.logString(nftBridgePass.tokenURI(1));
    }
}
