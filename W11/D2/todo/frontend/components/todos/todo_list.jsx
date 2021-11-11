import React from "react";
import TodoListItem from "../todo_list/todo_list_item";

const TodoList = (props) => {
  return (
    <div>
      <h1>Here is my Todo List for 2022</h1>
      <ul> 
        <TodoListItem props={props}/>
      </ul>
    </div>
  )
}

export default TodoList;