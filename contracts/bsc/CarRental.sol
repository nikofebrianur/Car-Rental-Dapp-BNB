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

    // addUser #nonExisting

    // addCar #onlyOwner #nonExistingCar

    // editCarMetadata #onlyOwner #existingCar

    // editCarStatus #onlyOwner #existingCar

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
