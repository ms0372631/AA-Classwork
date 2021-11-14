

export const allTodos = (state) => {
  let todosArray = Object.values(state.todos);
  return todosArray;
};

export const stepsByTodoId = (state, todoId) => {
  let stepsArray = [];
  Objeact.values(state.steps).forEach(step => {
    if (step.id === todoId)
      stepsArray.push(step);
  });
};

