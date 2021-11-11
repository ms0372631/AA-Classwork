import configureStore from "./store/store";
import {receiveTodo, receiveTodos} from "./actions/action";
import React from 'react';
import ReactDOM from "react-dom";
import allTodos from "./reducers/selectors"; 
import Root from "./components/root";
import App from "./components/app";


document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  const rootelement = document.getElementById("root");
  ReactDOM.render(<Root store={store}/>, rootelement);
  window.allTodos = allTodos;
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
});