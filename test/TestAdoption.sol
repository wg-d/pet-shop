pragma solidity ^0.5.0;

import "truffle/Assert.sol"; // Gives us various assertions to
// use in our tests. In testing, an assertion checks for things like equality, inequality or emptiness to return a pass/fail from our test.
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  // The address of the adoption contract to be tested
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // The id of the pet that will be used for testing
  uint expectedPetId = 8;

  // The expected owner of adopted pet is this contract
  address expectedAdopter = address(this);

}
