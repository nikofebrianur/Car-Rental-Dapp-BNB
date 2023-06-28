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

    // user mapping

    // car mapping

    // constructor

    // MODIFIERS

    // onylOwner

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
