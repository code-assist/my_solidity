pragma solidity 0.5.0; 

contract Bar {
    
    event FooChanged(uint8 num);
    uint256 public foo;
    
    constructor() public {
        reset();
    }

    function testAssert(bool _fail) external {
        setFoo(1);
        assert(_fail);
        setFoo(2);
    }
    
    function testRequire(bool _fail) external{
        setFoo(3);
        require(_fail, "Require false");
        setFoo(4);
    }
    
    function testReturn(bool _fail) external {
        setFoo(5);
        if (_fail){
            return;
        }
        setFoo(6);
    }
    
    function reset() public {
        setFoo(0);
    }
    
    function setFoo(uint8 num) private {
        foo = num;
        emit FooChanged(num);
    }

}

