pragma solidity ^0.5.0;

/**
 * The Parking contract allows the buying the selling of parking space
 */
contract User {
  string public firstName;
  string public lastName;
  House public house;
  address payable wallet;



  struct House {
    uint256 lat;
    uint256 long;
  }
  

  constructor(string memory _firstName, string memory _lastName, address payable _wallet, uint256 _lat, uint256 _long) public {
    firstName = _firstName;
    lastName = _lastName;
    wallet = _wallet;
    house = House(_lat,_long);
  }  

}

/**
 * The Owned contract ensures that only the creator (deployer) of a 
 * contract can perform certain tasks.
 */
contract Owned {
  address public owner = msg.sender;
  event OwnerChanged(address indexed old, address indexed current);
  modifier only_owner { require(msg.sender == owner); _; }
  function setOwner(address _newOwner) only_owner public { OwnerChanged(owner, _newOwner); owner = _newOwner; }
}

