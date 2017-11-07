pragma solidity ^0.4.8;

import "./Gamenation.sol";

contract GamenationOxem is Gamenation
{
    address public influencer = 0x4e0FAb057F1286fE6A6DF1E48cdc3E184DE355F5;

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