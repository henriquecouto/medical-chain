// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "entities/Appointment.sol";
import "entities/Doctor.sol";
import "entities/Patient.sol";

struct ClinicalDataType {
  Patient patient;
  Doctor doctor;
  Appointment appointment;
}