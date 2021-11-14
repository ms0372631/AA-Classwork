import React from 'react';
import TodoDetailViewContainer from '../todos/todo_detail_view_container';
import TodoDetailView from './todo_detail_view';

const TodoListItem = ({todos}) => {

  return (
    todos.map(todo => <li key={todo.id}>Title: {todo.title}</li>)
  );
};

export default TodoListItem;


 