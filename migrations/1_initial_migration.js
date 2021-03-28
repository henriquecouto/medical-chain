const Migrations = artifacts.require("Migrations");
const TemporaryAccess = artifacts.require("TemporaryAccess");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(TemporaryAccess);
};
