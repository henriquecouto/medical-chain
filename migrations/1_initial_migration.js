const Migrations = artifacts.require("Migrations");
const ClinicalData = artifacts.require("ClinicalData");
const TemporaryAccess = artifacts.require("TemporaryAccess");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(ClinicalData);
  deployer.deploy(TemporaryAccess);
};
