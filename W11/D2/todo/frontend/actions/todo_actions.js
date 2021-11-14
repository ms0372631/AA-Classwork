export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo,
  };
};

export const removeTodo = (todo) => {
  return {
    type: REMOVE_TODO,
    todo,
  };
};

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos,
  };
};

export const REMOVE_TODO = "REMOVE_TODO";
export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";