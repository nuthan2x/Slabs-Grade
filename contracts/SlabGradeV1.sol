// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SlabGrades {
    enum slabs {slab0_100, slab1_200, slab2_300, slab3_400, slab4_500}

    mapping (address => mapping (address => uint96) ) public deposits_ofuser;

    receive() external payable {}

    function _getslab(address _tokenaddress, address _user) public view returns(slabs currentslab) {
        uint96 balance = deposits_ofuser[_user][_tokenaddress];

        if (balance < 101) {
            currentslab = slabs.slab0_100;
        }
        if (balance > 100 && balance < 201) {
            currentslab = slabs.slab1_200;
        }
        if (balance > 200 && balance < 301) {
            currentslab = slabs.slab2_300;
        }
        if (balance > 300 && balance < 401) {
            currentslab = slabs.slab2_300;           
        }else {
            currentslab = slabs.slab4_500;
        }

    }

    function deposit(address _tokenaddress, uint96 _amount) public payable {
        require(_amount > 0, "send more than 0 tokens");
        IERC20(_tokenaddress).transferFrom(msg.sender, address(this), _amount);
        
        deposits_ofuser[msg.sender][_tokenaddress] += _amount;
    }

    function withdrawTokens(address _tokenaddress)  external {
        uint balance = IERC20(_tokenaddress).balanceOf(msg.sender);
        require(balance > 0, " you havent deposited to this contract");
        
        deposits_ofuser[msg.sender][_tokenaddress] = 0;

        // sending everything, can customze id want to withdraw partially by addding extra amount to withdraw in argument and 
        // update the deposits_ofuser state variable.
        IERC20(_tokenaddress).transfer(payable(msg.sender),balance); 
    }
    
}