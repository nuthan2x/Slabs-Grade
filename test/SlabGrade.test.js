const { expect } = require("chai");
const { ethers } = require('hardhat');

describe('SlabGradeV1', () => {
    let SlabGradeV1, slabGradeV1, addr1, addr2, addr3;
     
    
        beforeEach(async () => {
            SlabGradeV1 = await ethers.getContractFactory("SlabGradesV1");
            slabGradeV1 = await SlabGradeV1.deploy();
            [addr1, addr2, addr3] = await ethers.getSigners();
        })
    
    
    describe('deployment', () => {

        it('deployed contract', async () => {
            console.log(" deployment address : ", slabGradeV1.address)
        });
        
    });
    
    
    
});
