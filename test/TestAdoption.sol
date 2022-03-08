pragma solidity ^0.5.0;

import "truffle/Assert.sol"; // Gives us various assertions to
// use in our tests. In testing, an assertion checks for things like equality, inequality or emptiness to return a pass/fail from our test.
import "truffle/DeployedAddresses.sol";
// When running tests, Truffle will deploy a fresh instance of the contract being tested to the blockchain. This smart contract gets the address of the deployed contract.
import "../contracts/Adoption.sol";
//The smart contract we want to test.
contract TestAdoption {
  // The address of the adoption contract to be tested
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // The id of the pet that will be used for testing
  uint expectedPetId = 8;
// Testing the adopt() function
function testUserCanAdoptPet() public {
  uint returnedId = adoption.adopt(expectedPetId);

  Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
}

  // The expected owner of adopted pet is this contract
  address expectedAdopter = address(this);

}
