pragma solidity 0.8.8;

contract BasicSmartContract {
  mapping (address => uint256) internal balances;
  uint256 internal _totalSupply;

  constructor() {
    _totalSupply += 1000;
    balances[msg.sender] += 1000;
  }

  function transfer(address _to, uint256 _value) external returns (bool) {
      require(
          balances[msg.sender] >= _value,
          "ERC20_INSUFFICIENT_BALANCE"
      );
      require(
          balances[_to] + _value >= balances[_to],
          "UINT256_OVERFLOW"
      );

      balances[msg.sender] -= _value;
      balances[_to] += _value;

      return true;
  }

  function balanceOf(address _owner) external view returns (uint256) {
      return balances[_owner];
  }

}

// SPDX-License-Identifier: UNLICENSED
