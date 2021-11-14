import { connect } from 'react-redux';
import { receiveTodo, removeTodo,} from "../../actions/todo_actions";
import TodoList from './todo_list';
import {allTodos} from "../../reducers/selectors";
import App from '../app';

const mapStateToProps = (state) => {
  return {
    todos: allTodos(state),
    state,
  };
};

const mapDispatchtoProps = (dispatch) => {
  return  {
    receiveTodo: todo => dispatch(receiveTodo(todo)),
    removeTodo: todo => dispatch(removeTodo(todo)),
  };
};

const ListContainer = connect(mapStateToProps, mapDispatchtoProps)(TodoList);

export default ListContainer;

