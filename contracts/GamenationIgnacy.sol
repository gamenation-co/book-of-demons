pragma solidity ^0.4.8;

import "./Gamenation.sol";

contract GamenationIgnacy is Gamenation
{
    address public influencer = 0x516cc62c73a2e90345031C57819BC467Cd045c72;

    // Collect wei
    function withdraw() external isOwner
    {
        uint256 amount = this.balance;
        require(amount != 0);

        uint256 dist = (amount * 80) / 100;
        uint256 crt = (amount * 5) / 100;
        uint256 inf = (amount * 15) / 100;

        LogWithdraw(gamedev, dist);
        LogWithdraw(gamenation, crt);
        LogWithdraw(influencer, inf);

        gamedev.transfer(dist);
        gamenation.transfer(crt);
        influencer.transfer(inf);
    }
}