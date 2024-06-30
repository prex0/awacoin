// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import "forge-std/console2.sol";
import "forge-std/Script.sol";
import {AwaCoin} from "../src/AwaCoin.sol";

contract DeployCoin is Script {
    function setUp() public {}

    function run() public returns (AwaCoin awaCoin) {
        vm.startBroadcast();

        awaCoin = new AwaCoin{
            salt: 0x0000000000000000000000000000000000000000000000000000000171777777
        }(
            "awaCoin for IVS",
            "awaIVS",
            address(0x4b748969Ab77C9d09AE07b4282A151B82F96311B)
        );
        console2.log("awaCoin Deployed:", address(awaCoin));

        vm.stopBroadcast();
    }
}
