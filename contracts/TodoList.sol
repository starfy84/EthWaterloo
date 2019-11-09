pragma solidity ^0.5.0;

contract TodoList {
    // Number of tasks in the todo list
    uint public taskCount = 0; // State variable written to blockchain; Similar to class variables in OOP
    // Actually stores it as BN (Big Number)

    // Model the task
    struct Task {
        uint id;
        // Text
        string content;
        // Checkbox State of the Todo-List
        bool completed;
    }

    // Storage on the blockchain (key => struct) "database"
    mapping(uint => Task) public tasks;

    constructor() public{
        createTask("works");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }

}