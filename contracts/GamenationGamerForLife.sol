pragma solidity ^0.4.8;

import "./Gamenation.sol";

contract GamenationGamerForLife is Gamenation
{
    address public influencer = 0xFE1547e6CDfa38870ab57dD7A85faA556Ad9026C;

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