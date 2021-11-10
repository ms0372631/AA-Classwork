import {combineReducers} from 'redux';
import todosReducer from './todo_reducer';


const rootReducer = combineReducers({
  todos: todosReducer,
});

export default rootReducer;

// { id: 3, title: "New Todo" }