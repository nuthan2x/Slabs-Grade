// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SlabGradesV2 is Ownable {

    enum Slabs {slab0_100, slab1_200, slab2_300, slab3_400, slab4_500}
    uint[] public slablimits = [100,200,300,400,500];

    mapping (address => mapping (address => uint) ) public deposits_ofuser;
    event NewDeposit(address indexed _user, address _token, uint _amount);

    receive() external payable {}

    function _getslab(address _tokenaddress, address _user) public view returns(Slabs currentslab) {
        uint balance = deposits_ofuser[_user][_tokenaddress];
        uint[] memory _slablimits = slablimits;

        for (uint i = 0; i < _slablimits.length; i++) {
            if (i != 0) { // when i != 0
                if ( i != _slablimits.length - 1) { // when i != last element
                    if (balance > _slablimits[i - 1] && balance <= _slablimits[i]) {
                        currentslab = Slabs(i);
                        break;
                    }
                }else { // when i = last elemnt
                    if (balance > _slablimits[i]) {
                        currentslab = Slabs(i);
                        break;
                    }
                }
            }else { // when i = 0
                if (balance < _slablimits[i]) {
                    currentslab = Slabs(i);
                    break;
                }
            }
        }
    }

    function deposit(address _tokenaddress, uint _amount) public payable {
        require(_amount > 0, "send more than 0 tokens");
        IERC20(_tokenaddress).transferFrom(msg.sender, address(this), _amount);
        
        deposits_ofuser[msg.sender][_tokenaddress] += (_amount/ 10 ** ERC20(_tokenaddress).decimals());
        emit NewDeposit(msg.sender, _tokenaddress, _amount);
    }

    function withdrawTokens(address _tokenaddress)  external {
        uint balance = deposits_ofuser[msg.sender][_tokenaddress];
        require(balance > 0, " you havent deposited to this contract");
        
        deposits_ofuser[msg.sender][_tokenaddress] = 0;

        // sending everything, can customze id want to withdraw partially by addding extra amount to withdraw in argument and 
        // update the deposits_ofuser state variable.
        IERC20(_tokenaddress).transfer(payable(msg.sender),balance); 
    }

    function updateSlablimits(uint[] calldata _newlimits) external onlyOwner {
        slablimits = _newlimits;
    }
    
}