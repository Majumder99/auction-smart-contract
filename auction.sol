// SPDX-License-Identifier: MIT

pragma solidity >=0.4.0;

contract auction{
    address payable public auctioner;
    uint public stblock;//start block
    uint public etblock;//end time


    //states of auction
    enum auction_state{start, running, end, cancel}
    auction_state public auctionState;

    uint public highestBid;
    uint public highestPayableBid;
    uint public bidIncrement;

    address payable public highestBidder;
    address payable public currentBidder;
    mapping(address=>uint) public bids;

    //initializing values
    constructor(){
        auctioner = payable(msg.sender);

    }

    //added modifiers
    modifier notOwner(){
        require(msg.sender != auctioner, "Owner cannot bid");
        _;
    }
    modifier owner(){
        require(msg.sender == auctioner, "You are not the owner");
        _;
    }
    modifier started(){
        require(block.number >= stblock);
        _;
    }
    modifier ended(){
        require(block.number < etblock);
        _;
    }

    function bid() public payable{

    }
} 