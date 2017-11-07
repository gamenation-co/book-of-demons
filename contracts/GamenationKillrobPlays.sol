pragma solidity ^0.4.8;

import "./Gamenation.sol";

contract GamenationKillrobPlays is Gamenation
{
    address public influencer = 0xdE0EaD565011C795f7082f7A3c4A9f5Df84FEd25;

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