pragma solidity ^0.4.19;

import "Curve-gen.sol"

contract Pedersen{
function commit(uint256 m, uint256 r, uint256 h) public returns (uint256[2]) {
        // Use random point initially to generate 2nd generator H
        Curve.G1Point memory H = Curve.HashToPoint(sha256(abi.encodePacked(h)));

        // Generate left point r * H
        Curve.G1Point memory a = Curve.g1mul(H, r);

        // Generate right point m * g
        Curve.G1Point memory b = Curve.g1mul(Curve.P1(), m);

        // Generate C = r * H + m * G
        Curve.G1Point memory c = Curve.g1add(a,b);

        return (c.X, c.Y);
    }
    
 function verify(uint256[2] commitment, uint256 m, uint256 r, uint256 h) returns(bool res) internal {
        // Use random point initially to generate 2nd generator H
        Curve.G1Point H = Curve.HashToPoint(sha256(abi.encodePacked(h)));

        // Generate left point r * H
        Curve.G1Point memory a = Curve.g1mul(H, r);

        // Generate right point m * g
        Curve.G1Point memory b = Curve.g1mul(G1.P1(), m);

        // Generate C = r * H + m * G
        Curve.G1Point memory c = Curve.g1add(lf, rt);

        return (c.X == commitment[0] && c.Y == commitment[1]);
    }
