# Solidity — Core Syntax

## Value Types

| Type | Description |
|---|---|
| `address` | 20-byte Ethereum address |
| `address payable` | Address that can receive Ether |
| `bool` | `true` / `false` |
| `uint8`..`uint256` | Unsigned integers (8 to 256 bit, step 8) |
| `int8`..`int256` | Signed integers |
| `bytes1`..`bytes32` | Fixed-size byte arrays |
| `bytes` | Dynamic byte array |
| `string` | Dynamic UTF-8 string |
| `enum` | User-defined set of named values |

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Types {
    address public owner;
    uint256 public totalSupply;
    bool public paused;
    bytes32 public hash;

    enum Status { Pending, Active, Closed }
    Status public currentStatus;
}
```

## Reference Types

```solidity
contract References {
    // Fixed-size array
    uint256[10] public fixedArr;

    // Dynamic array
    uint256[] public dynArr;

    // Struct
    struct User {
        address wallet;
        uint256 balance;
        bool active;
    }

    // Mapping (key => value, no iteration)
    mapping(address => User) public users;
    mapping(address => mapping(address => uint256)) public allowances;

    function addUser(address _addr) external {
        users[_addr] = User({wallet: _addr, balance: 0, active: true});
        dynArr.push(100);
    }
}
```

## Visibility Modifiers

| Modifier | External | Internal | Inherited | Same Contract |
|---|---|---|---|---|
| `external` | Yes | No | No | No (use `this.f()`) |
| `public` | Yes | Yes | Yes | Yes |
| `internal` | No | Yes | Yes | Yes |
| `private` | No | No | No | Yes |

```solidity
function externalFn() external {}  // only callable externally
function publicFn() public {}      // callable anywhere
function internalFn() internal {}  // this contract + derived
function privateFn() private {}    // this contract only
```

## State Mutability

```solidity
// pure — no state read or write
function add(uint a, uint b) external pure returns (uint) {
    return a + b;
}

// view — reads state, no modification
function getBalance() external view returns (uint) {
    return address(this).balance;
}

// payable — accepts Ether
function deposit() external payable {
    balances[msg.sender] += msg.value;
}

// nonpayable (default) — reverts if Ether sent
function doWork() external {}
```

## Modifiers and Error Handling

```solidity
modifier onlyOwner() {
    require(msg.sender == owner, "Not owner");
    _;  // execute rest of function
}

modifier whenNotPaused() {
    require(!paused, "Contract paused");
    _;
}

function withdraw(uint amount) external onlyOwner whenNotPaused {
    require(amount <= balances[msg.sender], "Insufficient");
    balances[msg.sender] -= amount;
    (bool ok, ) = msg.sender.call{value: amount}("");
    require(ok, "Transfer failed");
}

// revert with custom error (cheaper than require string)
error Unauthorized(address caller);
error InsufficientBalance(uint available, uint requested);

function transfer(uint amount) external {
    if (msg.sender != owner) revert Unauthorized(msg.sender);
    if (amount > balances[msg.sender])
        revert InsufficientBalance(balances[msg.sender], amount);
    // ...
}

// assert — for internal invariants (should never fail)
assert(totalSupply == calculatedTotal);
```

## Events

```solidity
event Transfer(address indexed from, address indexed to, uint256 value);
event Deposit(address indexed user, uint256 amount);

function transfer(address to, uint256 amount) external {
    // ... state changes ...
    emit Transfer(msg.sender, to, amount);
}
```

- `indexed` — up to 3 params per event, searchable in logs
- Unindexed params stored in log data (cheaper, not searchable)

## Inheritance

```solidity
contract Base {
    function greet() public virtual returns (string memory) {
        return "Hello from Base";
    }
}

contract Child is Base {
    function greet() public override returns (string memory) {
        return "Hello from Child";
    }
}

// Multiple inheritance (C3 linearization)
contract A { function f() public virtual {} }
contract B is A { function f() public virtual override {} }
contract C is A { function f() public virtual override {} }
contract D is B, C { function f() public override(B, C) {} }
```

## Interfaces and Abstract Contracts

```solidity
// Interface — no implementation, all functions external
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

// Abstract contract — may have partial implementation
abstract contract BaseToken {
    mapping(address => uint256) public balances;

    function totalSupply() public view virtual returns (uint256);

    function _mint(address to, uint256 amount) internal {
        balances[to] += amount;
    }
}

contract MyToken is IERC20, BaseToken {
    function totalSupply() public view override(BaseToken, IERC20) returns (uint256) {
        // ...
    }
}
```

## Libraries

```solidity
library SafeMath {
    function add(uint a, uint b) internal pure returns (uint) {
        uint c = a + b;
        require(c >= a, "Overflow");
        return c;
    }
}

contract Token {
    using SafeMath for uint256;

    uint256 public total;
    function mint(uint amount) external {
        total = total.add(amount);  // library call
    }
}
```

## Common Patterns

### Ownable

```solidity
abstract contract Ownable {
    address public owner;
    event OwnershipTransferred(address indexed prev, address indexed next);

    modifier onlyOwner() { require(msg.sender == owner, "Not owner"); _; }

    constructor() { owner = msg.sender; }

    function transferOwnership(address newOwner) external onlyOwner {
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
```

### ReentrancyGuard

```solidity
abstract contract ReentrancyGuard {
    uint256 private _status = 1;

    modifier nonReentrant() {
        require(_status == 1, "Reentrant call");
        _status = 2;
        _;
        _status = 1;
    }
}
```

### AccessControl

```solidity
contract Vault {
    mapping(bytes32 => mapping(address => bool)) public roles;
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER");

    modifier hasRole(bytes32 role) {
        require(roles[role][msg.sender], "Missing role");
        _;
    }

    function grantRole(bytes32 role, address account) external hasRole(ADMIN_ROLE) {
        roles[role][account] = true;
    }
}
```

## Gas Optimization Tips

- Use `calldata` instead of `memory` for external function params (no copy)
- Pack struct fields to fit in fewer 32-byte slots
- Use `uint256` over smaller types (EVM works in 256-bit words)
- Use custom errors instead of string messages (cheaper)
- Cache storage reads in local variables
- Prefer `external` over `public` when function is only called externally
- Use unchecked blocks for safe arithmetic: `unchecked { i++ }`

## See Also

- [README.md](README.md) — overview and quick reference
