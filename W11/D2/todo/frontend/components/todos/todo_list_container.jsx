import { connect } from 'react-redux';
import { receiveTodo, receiveTodos } from '../../actions/action';
import todo_list from './todo_list';
import allTodos from '../../reducers/selectors';
import App from '../app';

const mapStateToProps = (state) => {
  return {
    todos: allTodos(state)
  };
};

const mapDispatchtoPros = (dispatch) => ({
  receiveTodo: (todo) => dispatch(receiveTodos(todo))
});


const ListContainer = connect(mapStateToProps, mapDispatchtoPros)(todo_list);
export default ListContainer;
