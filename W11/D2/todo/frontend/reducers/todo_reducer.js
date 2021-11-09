
import { RECEIVE_TODO } from "../actions/todo_actions";

const todoReducer = (state = {}, action) => {
  Object.freeze(state);
  // old state and new state will be compared
  // to figure out what needs to be updated in views
  // so we must ensure the "state" doesn't change

  const nextState = Object.assign({}, state);
  // merges all args after the first into the first
  // essentially a copy of the original state

  switch (action.type) {
    case RECEIVE_TODO:
      // nextState looks like... {  }
      // nextState[1] -> now it looks like... { 1: ??? }
      // nextState[1] = something -> now it looks like... { 1: something }
      nextState[action.todo.id] = action.todo;
      return nextState;
    default:
      return state;
  }
}



export default todoReducer;