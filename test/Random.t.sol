// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/random/ISetupRandom.sol";
import "../src/random/IRandom.sol";

contract RandomTest is Test {
    string iSetupRandomAddressKey = "SETUP_CONTRACT";

    address iSetupRandomAddress = vm.envAddress(iSetupRandomAddressKey);
    ISetupRandom iSetupRandom = ISetupRandom(iSetupRandomAddress);

    address iRandomAddress;
    IRandom iRandom;

    function testExploit() public {
        vm.createSelectFork(vm.rpcUrl("paradigm"));

        iRandomAddress = iSetupRandom.random();
        iRandom = IRandom(iRandomAddress);

        emit log_named_address("iRandom", address(iRandom));
        iRandom.solve(0x04);

        emit log_named_uint("Solved", iRandom.solved() ? 1 : 0);

        assert(iRandom.solved());
    }
}
