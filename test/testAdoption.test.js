//We begin our test by importing our Adoption contract using artifacts.require.
const Adoption = artifacts.require("Adoption");

contract("Adoption", (accounts) => {
  let adoption;
  let expectedAdopter;
/*Then, we make use of the before to provide initial setups for the following: * Adopt a pet with id 8 and assign 
it to the first account within the test accounts on the network. * This function later is used to check whether 
the petId: 8 has been adopted by accounts[0].*/
  before(async () => {
      adoption = await Adoption.deployed();
  });
  /*To test the adopt function, recall that upon success it returns the given adopter. 
  We can ensure that the adopter based on given petID was returned and is compared with
   the expectedAdopter within the adopt function.*/
   describe("adopting a pet and retrieving account addresses", async () => {
    before("adopt a pet using accounts[0]", async () => {
      await adoption.adopt(8, { from: accounts[0] });
      expectedAdopter = accounts[0];
    });
  
    it("can fetch the address of an owner by pet id", async () => {
      const adopter = await adoption.adopters(8);
      assert.equal(adopter, expectedAdopter, "The owner of the adopted pet should be the first account.");
    });
    it("can fetch the collection of all pet owners' addresses", async () => {
        const adopters = await adoption.getAdopters();
        assert.equal(adopters[8], expectedAdopter, "The owner of the adopted pet should be in the collection.");
      });
      
  });z
/*
We call smart contract method adopters to see what address adopted the pet with petID 8.
Truffle imports Chai for the user so we can use the assert functions. We pass the actual value, the expected value and a failure message (which gets printed to the console if the test does not pass) to assert.equal().
*/  
});
