// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "entities/ClinicalDataType.sol";

interface IClinicalData {
  function minter() view external returns(address _address);
  
  function save(ClinicalDataType memory _clinicalData) external;

  function get() external view returns(ClinicalDataType memory);

  function get(address _reader) external view returns(ClinicalDataType memory);
}