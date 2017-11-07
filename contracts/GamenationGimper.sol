pragma solidity ^0.4.8;

import "./Gamenation.sol";

contract GamenationGimper is Gamenation
{
    address public influencer = 0x6F8291F712c424C1F7a8A36A9B59022eBf7c9670;

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