// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "entities/ClinicalDataType.sol";
import "./definitions/ClinicalData.sol";

contract ClinicalData is IClinicalData {
  address override public minter;
  ClinicalDataType clinicalData;

  constructor() {
    minter = msg.sender;
  }
  
  modifier onlyBy(address _address){
    require(msg.sender==_address || tx.origin == _address, 'user not allowed');
    _;
  }

  modifier onlyExternal(){
    require(msg.sender != tx.origin, 'only another contract can call this method');
    _;
  }

  function save(ClinicalDataType memory _clinicalData) override public onlyBy(minter) {
    clinicalData = _clinicalData;
  }

  function get() override public onlyBy(minter) view returns(ClinicalDataType memory) {
    return clinicalData;
  }
  
  function get(address _reader) override public onlyBy(_reader) onlyExternal view returns(ClinicalDataType memory) {
    return clinicalData;
  }
}