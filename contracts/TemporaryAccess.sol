// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./definitions/ClinicalData.sol";
import "entities/ClinicalDataType.sol";

contract TemporaryAccess {

  struct TemporaryAccessType {
    address reader;
    uint256 allowUntil;
  }

  mapping(IClinicalData => TemporaryAccessType) temporaryAccesses;

  function allowAccess(uint256 _allowUntil, IClinicalData _clinicalData, address _reader) public {
    require(msg.sender == _clinicalData.minter(), 'you are not the owner of this clinical data');
    temporaryAccesses[_clinicalData] = TemporaryAccessType(_reader, _allowUntil);
  }

  function get(IClinicalData _clinicalData) public view returns(ClinicalDataType memory) {
    require(temporaryAccesses[_clinicalData].reader == msg.sender, 'you are not allowed to read this clinical data');
    require(temporaryAccesses[_clinicalData].allowUntil >= block.timestamp, 'your access has expired');
    return _clinicalData.get(msg.sender);
  }
}
