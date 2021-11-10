import configureStore from "./store/store";
import {receiveTodo, receiveTodos} from "./actions/action";


document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
});