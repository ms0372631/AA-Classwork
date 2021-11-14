import { connect } from 'react-redux';
import { receiveTodo, removeTodo } from "../../actions/todo_actions";
import todo_list from './todo_list';
import allTodos from '../../reducers/selectors';
import App from '../app';

const mapStateToProps = (state) => {
  return {
    todos: allTodos(state)
  };
};

const mapDispatchtoProps = (dispatch) => ({
  receiveTodo: todo => dispatch(receiveTodo(todo)),
  removeTodo: todo => dispatch(removeTodo(todo)),
});


const ListContainer = connect(mapStateToProps, mapDispatchtoProps)(todo_list);
export default ListContainer;
