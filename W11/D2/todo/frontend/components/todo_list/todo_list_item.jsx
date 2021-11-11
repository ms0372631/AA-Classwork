import React from 'react';

const TodoListItem = ({props}) => {
  return (
    props.todos.map(todo => <li key={todo.id}>Title: {todo.title}</li>)
  )
};

export default TodoListItem;

// 
 