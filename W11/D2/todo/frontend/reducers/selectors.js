import rootReducer from "./root_reducer";
import todosReducer from "./todo_reducer";

const allTodos = (state) => {
  let todosArray = Object.values(state.todos);
  return todosArray;
};

export default allTodos;