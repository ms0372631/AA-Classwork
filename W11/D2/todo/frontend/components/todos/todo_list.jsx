import React from "react";
import TodoListItem from "../todo_list/todo_list_item";
import TodoForm from "../todo_list/todo_from";

const TodoList = (props) => {
  console.log(props);
  return (
    <div>
      <h1>Here is my Todo List for 2022</h1>
      <ul> 
        
        <TodoListItem todos={props.todos}/>
      </ul>
      <ul>
        <TodoForm receiveTodo={props.receiveTodo}/>
      </ul>
    </div>
  )
}

export default TodoList;