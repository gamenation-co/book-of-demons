pragma solidity ^0.4.8;

contract Gamenation
{
    address public gamenation = msg.sender;
    address constant gamedev = 0xF017e7fd09Ea4a1C838AF4517289F997BC479ECE;
    bool purchasingAllowed = true;

    // Declare events for actions we may want to watch
    event LogReceived(address sender, uint256 amount);
    event LogWithdraw(address _to, uint256 amount);

    modifier isOwner() {
        require (msg.sender == gamenation);
        _;
    }

    // Enable/Disable contract
    function status(bool status) external isOwner {
        purchasingAllowed = status;
    }

    function () payable public
    {
        if(purchasingAllowed == false)
        {
            revert();
        } else {
            LogReceived(msg.sender, msg.value);
        }
    }

    // Collect wei
    function withdraw() external isOwner
    {
        uint256 amount = this.balance;
        require(amount != 0);

        uint256 dist = (amount * 80) / 100;
        uint256 crt = (amount * 20) / 100;

        LogWithdraw(gamedev, dist);
        LogWithdraw(gamenation, crt);

        gamedev.transfer(dist);
        gamenation.transfer(crt);
    }
}