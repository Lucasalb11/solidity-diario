//spdx-licence-identifier: MIT
pragma solidity ^0.8.0;
contract Nome {
    string public nome;
    uint public idade;
    
    function atualizarpessoa(string memory _nome,uint _idade) public {
        nome = _nome;
        idade = _idade;
    }
    function lerpessoa() public view returns (string memory,uint){

     
       return (nome,idade);
    }
}