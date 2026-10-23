// SPDX-License-Identifier: MIT
pragma solidity 0.8.37;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CryptoMonster is ERC20 {
    address public owner;

    uint Time_start;
    uint Time_system;
    uint Time_now; 
    uint Time_dif = 0;

    mapping (string => Investor) public tabInvestors;
    mapping (address => Provider) public tabProviders;

    struct Provider {
        
    }
    struct Investor {
        string Name;
        address Address;
    }

    constructor() ERC20("CryptoMonster", "CMON") {
        owner = msg.sender;
        Time_start = block.timestamp;
        Time_now = block.timestamp;
        Time_system = Time_now + Time_dif;
        // uint _decimals = decimals();
        _mint(owner, 10_000_000*1e12);
        addInvestor("Investor1", 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        addInvestor("Investor2", 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
        addInvestor("Best friend", 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB);
        transfer(tabInvestors["Investor1"].Address, 300000);
        transfer(tabInvestors["Investor2"].Address, 400000);
        transfer(tabInvestors["Best friend"].Address, 200000);
    }

    // function decimals() public pure override returns (uint8) {
    //     return 12;
    // }

    function updateTime() public {
        Time_now = block.timestamp;
        Time_system = Time_now + Time_dif;
    }

    function addOneMinute() public  {
        updateTime();
        Time_system = Time_now + Time_dif;
        Time_dif += 60; 
    }

    function getTimeSystem() public view returns(uint256) {
        return Time_system;
    }

    function getTimeReal() public view returns(uint256) {
        return Time_now;
    }


    function addInvestor(string memory _Name, address _Address) public {
        require(msg.sender == owner, "You are not owner");
        tabInvestors[_Name] = Investor (
            _Name,
            _Address
        );
    }

    functi





}