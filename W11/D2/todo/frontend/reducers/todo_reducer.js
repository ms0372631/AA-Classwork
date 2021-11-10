import { RECEIVE_TODO, RECEIVE_TODOS } from "../actions/action";

const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  // old state and new state will be compared
  // to figure out what needs to be updated in views
  // so we must ensure the "state" doesn't change

  const nextState = Object.assign({}, state);
  // merges all args after the first into the first
  // essentially a copy of the original state

  switch (action.type) {
    case RECEIVE_TODO:
      const todoId = action.todo.id;
      const newTodo = {};
      newTodo[todoId] = action.todo;
      // nextState looks like... {  }
      // nextState[1] -> now it looks like... { 1: ??? }
      // nextState[1] = something -> now it looks like... { 1: something }
      return Object.assign(nextState, newTodo);
    case RECEIVE_TODOS:
      let todos = {};
      action.todos.forEach((todoObj, i) => {
        todos[todoObj.id] = todoObj;
      });
      return todos;
    default:
      return state;
  }
}

// const newTodos = [{ id: 1, ...etc }, { id: 2, ...etc }, ...etc];

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

// const todosReducer = (state = {}, action) => {
//   Object.freeze(state);
//   // old state and new state will be compared
//   // to figure out what needs to be updated in views
//   // so we must ensure the "state" doesn't change

//   const nextState = Object.assign({}, state);
//   // merges all args after the first into the first
//   // essentially a copy of the original state

//   switch (action.type) {
//     case RECEIVE_TODOS:
//       // nextState looks like... {  }
//       // nextState[1] -> now it looks like... { 1: ??? }
//       // nextState[1] = something -> now it looks like... { 1: something }
//       nextState[action.todos.id] = action.todos;
//       return nextState;
//     default:
//       return state;
//   }
// }


export default todosReducer;