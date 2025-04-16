//spdx-licence-identifier: MIT
pragma solidity ^0.8.0;
contract payment {
    adress payable public destinatario;

    constructor(adress payable _destinatario) {
        destinatario = _destinatario;
    }
    function  trenviarpagamento() public payable {
        require(msg.value > 0, "Valor deve ser maior que zero");
        _destinatario.transfer(msg.value);
    }
    function saldo() public view returns (uint) {
        return address(this).balance;
    }
} 