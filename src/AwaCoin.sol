// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20Permit} from "openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";

/**
 * @title AwaCoin
 * @notice AwaCoin is a simple ERC20 token with permit.
 */
contract AwaCoin is ERC20Permit, Ownable {
    constructor(string memory _name, string memory _symbol, address _owner)
        ERC20(_name, _symbol)
        ERC20Permit(_name)
        Ownable(_owner)
    {
    }

    function decimals() public view override(ERC20) returns (uint8) {
        return 0;
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }
}
