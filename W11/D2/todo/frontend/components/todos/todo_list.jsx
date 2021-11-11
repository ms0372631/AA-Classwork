import React from "react";
import TodoListItem from "../todo_list/todo_list_item";
import TodoForm from "../todo_list/todo_from";

const TodoList = (props) => {
  return (
    <div>
      <h1>Here is my Todo List for 2022</h1>
      <ul> 
        <TodoListItem props={props}/>
      </ul>
      <ul>
        <TodoForm recieveTodo={props.recieveTodo}/>
      </ul>
    </div>
  )
}

export default TodoList;