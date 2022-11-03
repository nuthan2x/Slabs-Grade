const { expect } = require("chai");
const { ethers } = require('hardhat');

describe('SlabGradeV1', () => {
    let SlabGradeV2, slabGradeV2, addr1, addr2, addr3;
     
    
        beforeEach(async () => {
            SlabGradeV2 = await ethers.getContractFactory("SlabGradesV2");
            slabGradeV2 = await SlabGradeV2.deploy();
            [addr1, addr2, addr3] = await ethers.getSigners();
        })
    
    
    describe('deployment', () => {

        it('deployed contract', async () => {
            console.log(" deployment address : ", slabGradeV2.address)
        });
        
    });
    
    
    
});
