// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Context.sol";
import "./Ownable.sol";
import "./IERC20.sol";
import "./CloneFactory.sol";
// import "./SafeMath.sol";
import "./IBridge.sol";
import "./ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract Factory is CloneFactory, ReentrancyGuard, Ownable {
    using Address for address payable;
    // using SafeMath for uint256;

    event DeployedBridge(
        string projectId,
        address contractBridge,
        address deployerAccount,
        address monitorAccount,
        address contractBridgeOrigin,
        address contractToken,
        uint256 deployedFee
    );

    event DepositToken(address contractBridge, uint256 amount, string toBlockchain, string toAddress);

    string private constant _name = "Bridge Factory V1";
    address public constant projectWallet = payable(0xE11fce0B4b2AB0635Ae6d0cbB0b62e33F4a80924); // GoerBridge Deployer
    uint256 public deployFee;
    mapping(address => bool) public listBridge;
    mapping(address => mapping (string => bool)) public checkUnique;

    function name() public view returns (string memory) {
        return _name;
    }

    constructor(address contractOrigin, uint256 valueFee) {
        listBridge[contractOrigin] = true;
        deployFee = valueFee;
    }

    function deployedBridge(
        address contractOrigin,
        address token,
        address monitorAccount,
        string calldata projectId,
        uint256 feeNative,
        uint256 feePercentBridge
    ) public payable {
        require(
            listBridge[contractOrigin] == true,
            "Contract bridge not found."
        );
        require(msg.value >= deployFee, "Invalid amount");
        address payable reciever = payable(projectWallet);
        reciever.sendValue(deployFee);
        address bridgeClone = createClone(contractOrigin);
        IBridge(bridgeClone).setDeployBridge(token, _msgSender(), monitorAccount, feeNative, feePercentBridge);
        checkUnique[contractOrigin][projectId] = true;

        emit DeployedBridge(
            projectId,
            bridgeClone,
            _msgSender(),
            monitorAccount,
            contractOrigin,
            token,
            deployFee
        );

        uint256 refund = msg.value - deployFee;
        if (refund > 0) {
            payable(msg.sender).sendValue(refund);
        }
    }

    function setListBridge(address contractOrigin, bool active)
        public
        onlyOwner
    {
        listBridge[contractOrigin] = active;
    }

    function setDeployFee(uint256 fee) public onlyOwner {
        deployFee = fee;
    }

    receive() external payable {}
}
