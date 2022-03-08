pragma solidity ^0.5.0; // 0.5.0 or higher

contract Adoption {
    address[16] public adopters;
    // Adopting a pet
    function adopt(uint petId) public returns (uint) {
    require(petId >= 0 && petId <= 15);

    adopters[petId] = msg.sender;

    return petId;
    }
    function getAdopters() public view returns (address[16] memory) { //memory gives the data location for the variable.
       return adopters;
    }
}