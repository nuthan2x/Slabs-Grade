// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SlabGrades {
    enum slabs {slab0_100, slab1_200, slab2_300, slab3_400, slab4_500}

    // slab of user of a particular erc20
    struct slabof_token{
        address tokenaddress;
        slabs currentslab;
    }  

    mapping (address => slabof_token) public slabs_ofuser;

    receive() external payable {}

    function getslab(address _tokenaddress, address _user) public view returns(slabs currentslab) {
        uint balance = IERC20(_tokenaddress).balanceOf(_user);

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
    
}