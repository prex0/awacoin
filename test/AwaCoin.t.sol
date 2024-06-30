// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {AwaCoin} from "../src/AwaCoin.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";

contract AwaCoinTest is Test {
    AwaCoin public awaCoin;

    uint256 privKeyOwner = 123;
    uint256 privKeyUser = 124;

    address owner = vm.addr(privKeyOwner);
    address user = vm.addr(privKeyUser);

    function setUp() public {
        awaCoin = new AwaCoin("awawabar Coin", "awaCoin", owner);
    }

    function test_detail() public {
        assertEq(awaCoin.symbol(), "awaCoin");
        assertEq(awaCoin.decimals(), 0);
    }

    function test_Mint() public {
        vm.prank(owner);
        awaCoin.mint(user, 100);

        assertEq(awaCoin.balanceOf(user), 100);
    }

    function test_CannotMint() public {
        vm.expectRevert(abi.encodeWithSelector(Ownable.OwnableUnauthorizedAccount.selector, address(this)));
        awaCoin.mint(user, 100);
    }

    function test_transferOwnership() public {
        vm.prank(owner);
        awaCoin.transferOwnership(user);

        vm.prank(user);
        awaCoin.mint(user, 100);

        assertEq(awaCoin.balanceOf(user), 100);
    }
}
