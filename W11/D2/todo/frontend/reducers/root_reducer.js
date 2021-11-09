
import {combineReducers} from 'redux';
import todoReducer from './todo_reducer';
import todosReducer from './todos_reducer';

const rootReducer = combineReducers({
  todo: todoReducer,
  todos: todosReducer
});

export default rootReducer;