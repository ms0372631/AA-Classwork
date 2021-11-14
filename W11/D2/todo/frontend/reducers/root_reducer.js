import {combineReducers} from 'redux';
import todosReducer from './todo_reducer';
import stepsReducer from './step_reducer';


const rootReducer = combineReducers({
  todos: todosReducer,
  steps: stepsReducer
});

export default rootReducer;

// { id: 3, title: "New Todo" }