// SPDX-License-Identifier: MIT
// SPDX-License-Identifier is optional
pragma solidity 0.8.30;
// pragma solidity ^0.8.30; // any version above this is ok
// pragma solidity >=0.8.28 <0.9.0; // any version between this is ok

// Common types: boolean, unit, unit, int, string
// Special types: address, bytes (string format)
// variable is initialized to 0 (or null) if there is not initialization value

// In Remix, use ctrl + S to save and compile.
// If the Solidity compiler button turns green after compiling, it is successful

// Every contract has an address like wallet account address do
// Deploy a contract is like make a transaction (therefore, deploy a contract will contain trancation info)
/*
[vm] from: 0x5B3...eddC4 to: SimpleStorage.(constructor) value: 0 wei data: 0x608...e0033 logs: 0 hash: 0xc8a...12466
status	0x1 Transaction mined and execution succeed
transaction hash	0xc8a42fbe5d8624eb186958b9adcf9fb17fc64160a1543595dea83513e5a12466
block hash	0x0b67e33b7bdd39e1b52c17d47406d385415800b8c482c4a794fa3ec42b1ee686
block number	1
contract address	0xd9145CCE52D386f254917e481eB44e9943F39138
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	SimpleStorage.(constructor)
gas	115413 gas
transaction cost	100359 gas 
execution cost	43491 gas 
input	0x608...e0033
output	0xd91...91338
decoded input	{}
decoded output	 - 
logs	[]
raw logs	[]
*/

// ==========================================================
// private variable
// contract SimpleStorage {
//     uint256 favoriteNumber; // uint256 is the same as uint, default visibility is internal
//     function store(uint256 _favoriteNumber) public {
//         favoriteNumber = _favoriteNumber;
//     }
// }

/*
After deploy above contract, we will get an address
0xd9145CCE52D386f254917e481eB44e9943F39138
*/

/*
We can execute the store funtion and the info is like this (store(52835729)):

[vm]from: 0x5B3...eddC4 to: SimpleStorage.store(uint256) 0xd91...39138 value: 0 wei data: 0x605...63591 logs: 0 hash: 0xfaa...a5f9a
status	0x1 Transaction mined and execution succeed
transaction hash	0xfaa4fdf206014dd5e0c076b470f811f847451dac18a403180d0b1d4cd91a5f9a
block hash	0x9c71436e328e501088fb268f7880325969c3a2e3f571d1e0a5c053b5b3e8f967
block number	2
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	SimpleStorage.store(uint256) 0xd9145CCE52D386f254917e481eB44e9943F39138
gas	50292 gas
transaction cost	43732 gas 
execution cost	22492 gas 
input	0x605...63591
output	0x
decoded input	{
	"uint256 _favoriteNumber": "52835729"
}
decoded output	{}
logs	[]
raw logs	[]
*/

// ==========================================================
// If we would like to make the variable public, we can use this:
// contract SimpleStorage {
//     uint256 public favoriteNumber; // uint256 is the same as uint
//     function store(uint256 _favoriteNumber) public {
//         favoriteNumber = _favoriteNumber;
//     }
// }

/*
for this contract, after we execute the store funtion, we can call favoriteNumber to get this number

[vm]from: 0x5B3...eddC4 to: SimpleStorage.store(uint256) 0xf8e...9fBe8 value: 0 wei data: 0x605...0ba16 logs: 0 hash: 0x247...e2d02
call to SimpleStorage.favoriteNumber
CALL
[call]from: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4to: SimpleStorage.favoriteNumber()data: 0x471...f7cdf
from	0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
to	SimpleStorage.favoriteNumber() 0xf8e81D47203A594245E36C48e151709F0C19fBe8
execution cost	2402 gas (Cost only applies when called by a contract)
input	0x471...f7cdf
output	0x000000000000000000000000000000000000000000000000000000000000ba16
decoded input	{}
decoded output	{
	"0": "uint256: 47638"
}
logs	[]
raw logs	[]
*/

// The more computational expensive cost, the more the gas fee

// ==========================================================
//⭐scope
// contract SimpleStorage {
//     uint256 public favoriteNumber; // uint256 is the same as uint
//     function store(uint256 _favoriteNumber) public {
//         favoriteNumber = _favoriteNumber;
//         uint256 testVar = 9;
//     }

//     function testfun() public {
//         testVar = 5; // error, testVar is not in this scope
//     }
// }

// ==========================================================
// return function
contract SimpleStorage {
    uint256 public favoriteNumber; // uint256 is the same as uint
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view (don't allow to modify blockchain at all) 
    // (Cost only applies when called by a contract, and no tranaction cost)
    function retrive_value() public view returns(uint256){
        return favoriteNumber;
    }

    // pure (Cost like view, additionally, pure don't allow to read from blockchian state)
    function add_value() public pure  returns(uint256){
        // return favoriteNumber; // error
        return 1 + 2;
    }
}