//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./tokens/CLTokenSimple.sol";
import "./tokens/CLMintableToken.sol";
import "./tokens/CLBurnableToken.sol";
import "./tokens/CLMintableBurnableToken.sol";

contract CryptoLauncher {

    address _owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    uint256 _simpleTokenFee = 20000000000000000;
    uint256 _mintableTokenFee = 25000000000000000;
    uint256 _burnableTokenFee = 30000000000000000;
    uint256 _mintableBurnableTokenFee = 40000000000000000;

    //Owner => Token
    mapping(address => LaunchedToken[]) public _launchedTokens;

    enum TokenType{ SIMPLE_TOKEN, MINTABLE_TOKEN, BURNABLE_TOKEN, MINTABLE_BURNABLE_TOKEN }

    struct LaunchedToken {
        TokenType tokenType;
        ERC20 token;
    }

    function getMyLaunchedTokensLength() public view returns(uint){
        return _launchedTokens[address(msg.sender)].length;
    }
    function getMyLaunchedToken(uint index) public view returns(LaunchedToken memory){
        return _launchedTokens[address(msg.sender)][index];
    }

    function launchSimpleToken(string memory name, string memory symbol, uint256 totalSupply) public payable {
        require(msg.value >= _simpleTokenFee, "Fee required");
        CLTokenSimple launchedToken = new CLTokenSimple(name, symbol, totalSupply, address(msg.sender));
        _launchedTokens[address(msg.sender)].push(LaunchedToken(TokenType.SIMPLE_TOKEN, launchedToken));
    }
    function launchMintableToken(string memory name, string memory symbol, uint256 totalSupply) public payable {
        require(msg.value >= _mintableTokenFee, "Fee required");
        CLMintableToken launchedToken = new CLMintableToken(name, symbol, totalSupply, address(msg.sender));
        _launchedTokens[address(msg.sender)].push(LaunchedToken(TokenType.MINTABLE_TOKEN, launchedToken));
    }
    function launchBurnableToken(string memory name, string memory symbol, uint256 totalSupply) public payable {
        require(msg.value >= _burnableTokenFee, "Fee required");
        CLBurnableToken launchedToken = new CLBurnableToken(name, symbol, totalSupply, address(msg.sender));
        _launchedTokens[address(msg.sender)].push(LaunchedToken(TokenType.BURNABLE_TOKEN, launchedToken));
    }
    function launchMintableBurnableToken(string memory name, string memory symbol, uint256 totalSupply) public payable {
        require(msg.value >= _mintableBurnableTokenFee, "Fee required");
        CLMintableBurnableToken launchedToken = new CLMintableBurnableToken(name, symbol, totalSupply, address(msg.sender));
        _launchedTokens[address(msg.sender)].push(LaunchedToken(TokenType.MINTABLE_BURNABLE_TOKEN, launchedToken));
    }

    modifier onlyCL() {
        require(_owner == address(msg.sender), "Caller is not the owner");
        _;
    }

    function setFee(uint action, uint256 value) onlyCL public {
        if(action == uint(TokenType.SIMPLE_TOKEN)){
            _simpleTokenFee = value;
            return;
        }else if(action == uint(TokenType.MINTABLE_TOKEN)){
            _mintableTokenFee = value;
            return;
        }else if(action == uint(TokenType.BURNABLE_TOKEN)){
            _burnableTokenFee = value;
            return;
        }else if(action == uint(TokenType.MINTABLE_BURNABLE_TOKEN)){
            _mintableTokenFee = value;
            return;
        }
    }

    function withdrawFunds() onlyCL external {
        require(payable(msg.sender).send(address(this).balance));
    }

}