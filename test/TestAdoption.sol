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
        //We call the smart contract we declared earlier with the ID of expectedPetId.
        //Finally, we pass the actual value, the expected value and a failure message (which gets printed to the console if the test does not pass) to Assert.equal().
    }
    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
    }
    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }
    /*Note the memory attribute on adopters. The memory attribute tells Solidity to temporarily store the value in memory, rather than saving it to the contract's storage. Since adopters is an array, and we know from the first adoption test that we adopted pet expectedPetId, we compare the testing contracts address with location expectedPetId in the array.*/

    // The expected owner of adopted pet is this contract
    address expectedAdopter = address(this);

}
