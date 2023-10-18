pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";

contract BugTest is Test {

    address public something;

    function testNoBug() public {
        new SomeContract();
    }

    function testFailBug() public {
        vm.pauseGasMetering();
        new SomeContract();
    }
}

contract SomeContract {
    constructor() {
        BugTest(msg.sender).something();
    }
}
