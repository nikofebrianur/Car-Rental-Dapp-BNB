// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/utils/Counters.sol";

contract CarRental {
    // DATA

    // Counter
    using Counters for Counters.Counter;
    Counters.Counter private _counter;

    // Owner
    address private owner;

    // totalPayments
    uint private totalPayments;

    // user struct
    struct User {
        address walletAddress;
        string name;
        string lastName;
        uint rentedCarId;
        uint balance;
        uint debt;
        uint start;
    }
    // car struct
    struct Car {
        uint id;
        string name;
        string imgUrl;
        Status status;
        uint rentFee;
        uint saleFee;
    }

    // enum to indicate the status of the cara
    enum Status {
        Retired,
        InUse,
        Available
    }

    // events
    event CarAdded(
        uint indexed id,
        string name,
        string imgUrl,
        uint rentFee,
        uint saleFee
    );
    event CarMetaDataEdited(
        uint indexed id,
        string name,
        string imgUrl,
        uint rentFee,
        uint saleFee
    );
    event CarStatusEdited(uint indexed id, Status status);
    event UserAdded(
        address indexed walletAddress,
        string name,
        string lastName
    );
    event Deposit(address indexed walletAddress, uint amount);
    event CheckOut(address indexed walletAddress, uint indexed carId);
    event CheckIn(address indexed walletAddress, uint indexed carId);
    event PaymentMade(address indexed walletAddress, uint amount);
    event BalanceWithdraw(address indexed walletAddress, uint amount);

    // user mapping
   mapping(address => User) private users;

    // car mapping
   mapping(uint => Car) private cars;

    // constructor
   constructor() {
      owner = msg.sender;
      totalPayments = 0;
   }
    
    // MODIFIERS
    // onylOwner
    modifier onlyOwner() {
      require(msg.sender == owner, "Only owner is allowed to call this function.");
      _;
    }

    // FUNCTIONS

    // Execute Functions

    // setOwner #onlyOwner
    function setOwner(address _newOwner) external onlyOwner {
        owner = _newOwner;
    }

    // addUser #nonExisting
    function addUser(string calldata name, string calldata lastName) external {
        require(!isUser(msg.sender), "User already exists");
        users[msg.sender] = User(msg.sender, name, lastName, 0, 0, 0, 0);

        emit UserAdded(msg.sender, users[msg.sender].name, users[msg.sender].lastName);
    }

    // addCar #onlyOwner #nonExistingCar
    function addCar(string calldata name, string calldata url, uint rent, uint sale) external onlyOwner {
        _counter.increment();
        uint counter = _counter.current();
        cars[counter] = Car(counter, name, url, Status.Available, rent, sale);

        emit CarAdded(counter, cars[counter].name, cars[counter].url, cars[counter].rent, cars[counter].sale);
    }

    // editCarMetadata #onlyOwner #existingCar
    function editCarMetadata(uint id, string calldata name, string imgUrl, uint rentFee, uint saleFee) external onlyOwner {
        require(cars[id].id != 0, "Car with given ID does not exist");
        Car storage car = cars[id];
        if(bytes(name).length !=0) {
            car.name = name;
        }
        if(bytes(imgUrl).length !=0) {
            car.imgUrl = imgUrl;
        }
        if(rentFee > 0) {
            car.rentFee = rentFee;
        }
        if(saleFee > 0) {
            car.saleFee = saleFee;
        }

        emit CarMetaDataEdited(id, car.name, car.imgUrl, car.rentFee, car.saleFee);
    }

    // editCarStatus #onlyOwner #existingCar
    function editCarStatus(uint id, Status status) external onlyOwner {
        require(cars[id].id != 0, "Car with given ID does not exist");
        cars[id].status = status;

        emit CarStatusEdited(id, status);
    }

    // checkOut #existingUser #isCarAvailabe #userHasNotRentedACar #userHasNoDebt

    // checkIn #existingUser #isCarAvailable #userHasRentedACar

    // deposit #existingUser

    // makePtyment #existingUser #existingDebt #sufficentBalance

    // withdrawBalance #existingUser

    // withdrawOwnerBalance #onlyOwner

    // Query Functions

    // getOwner

    // isUser

    // getUSer #existinguser

    // getCar #existingCar

    // getCarByStatus

    // calculateDebt

    // getCurrentCount

    // getContractBalance #onlyOwner

    // getTotalPayment #onlyOwner
}
