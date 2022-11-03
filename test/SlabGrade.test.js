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
            const getslab = await slabGradeV1._getslab("0xD5fba05dE4b2d303D03052e8aFbF31a767Bd908e", "0xD5fba05dE4b2d303D03052e8aFbF31a767Bd908e")
            console.log(getslab);
            console.log(slabGradeV1.address)
        });
    });
    
    
    
});
