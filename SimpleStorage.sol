// SPDX-License-Identifier: MIT

// pragma solidity >=0.8.7 <0.9.0;
pragma solidity 0.8.8;

contract SimpleStorage {
    
    /*
        -----
        Types
        -----

        bool hasFavNum = false;
        uint256 favNum = 5; // uints can be defined by uint# and default to 256
        int256 favInt = -5;
        address myAddress = 0x09A5ffd5831A1054E41B6b3eE51B6Ab6e2C88090;
        string favNumText = "Five"; // Strings are bytes objects but they're only text
        // Bytes, ints, and uints can be defined by type# (must be divisible by 8)
        bytes32 favBytes = "cat"; // Bytes usually look like this: 0x114NKJHFJ1345F
    */    

    uint256 favNum;
    
    /*
        ---------
        Modifiers
        ---------

        public - anyone can call favNum
        private - only this contract can call favNum
        external - only someone outside this contract can call favNum
        internal (defaut) - only this contract and its children contracts can call favNum
    */
    
    /*
        -------
        Mapping
        -------

        When mapping, the mapped value will default to null, so you'll need to set it manually.
            In this case, we use addPerson() to do this.
    */

    // Create a "dictionary" where every name is mapped to a number
    mapping(string => uint256) public nameToFavNum;

    // Create a People type
    struct People {
        uint256 favNum;
        string name;
    }

    // Create a people list
    People[] public people;

    // Store uint256 param  in the favNum variable
    function store(uint256 _favNum) public {
        favNum = _favNum;
    }

    // If a function that is updating state calls retrieve, it will use gas.
    function retrieve() public view returns(uint256) {
        return favNum;
    }

    /*
        ------------
        Storing Data
        ------------

        There are 6 places you can store memory:
            Stack, Memory, Storage, Calldata, Code, Logs
    
        Arrays, Structs, and Mappings require memory.

        Since a string is actually an array of bytes, and arrays are stored in memory,
            we have to use the memory keyword when storing _name in addPerson()
    */

    // Push params into people array
    function addPerson(string memory _name, uint256 _favNum) public {
        people.push(People(_favNum, _name));
        nameToFavNum[_name] = _favNum;
    }

}
