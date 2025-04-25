// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PresencaEvento {
    address public owner;
    bool public eventoEncerrado;
    uint public totalPresencas;

    mapping(address => bool) public presencas;

    // Modificador para restringir ações ao dono
    modifier onlyOwner() {
        require(msg.sender == owner, "Somente o dono pode executar essa acao");
        _;
    }

    // Construtor: define o dono do contrato
    constructor() {
        owner = msg.sender;
        eventoEncerrado = false;
    }

    // Função para confirmar presença
    function confirmarPresenca() public {
        require(!eventoEncerrado, "Evento encerrado");
        require(!presencas[msg.sender], "Presenca ja registrada");

        presencas[msg.sender] = true;
        totalPresencas++;
    }

    // Verifica se uma pessoa confirmou presença
    function verificarPresenca(address _pessoa) public view returns (bool) {
        return presencas[_pessoa];
    }

    // Retorna o total de presencas
    function quantidadePresencas() public view returns (uint) {
        return totalPresencas;
    }

    // Encerra o evento (somente o dono pode)
    function encerrarEvento() public onlyOwner {
        eventoEncerrado = true;
    }
}