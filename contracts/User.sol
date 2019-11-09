pragma solidity ^0.5.0;

/**
 * The Parking contract allows the buying the selling of parking space
 */
contract User {
  string firstName;
  string lastName;

  uint256 lat;
  uint256 long;
  address payable wallet;

  //This is an event, dont ask me what it does
  event Purchase(address indexed _buyer, uint256 _amount);

  function getFirstName () public view returns(string memory) {
    return firstName;
  }

  function setFirstName (string memory _firstName) public {
    firstName = _firstName;
  }

  function getLastName () public view returns(string memory) {
    return lastName;
  }

  function setLastName (string memory _lastName) public {
    lastName = _lastName;
  }

  function getLat () public view returns(uint256) {
    return lat;
  }

  function setLat (uint256 _lat) public {
    lat = _lat;
  }

  function getLong () public view returns(uint256) {
    return long;
  }

  function setLong (uint256 _long) public {
    long = _long;
  }

  function getWallet () public view returns(address payable){
    return wallet;
  }

  function setWallet (address payable _wallet) public {
    wallet = _wallet;
  }
  
  function getBalance () public view returns(uint256){
    return wallet.balance;
  }
  
  function buyNothing() public payable{
    wallet.transfer(msg.value);
    emit Purchase(msg.sender,1);
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
  function setOwner(address _newOwner) only_owner public { emit OwnerChanged(owner, _newOwner); owner = _newOwner; }
}

