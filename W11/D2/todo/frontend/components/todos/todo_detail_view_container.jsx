import {connect} from 'react-redux';
import {removeTodo} from '../../actions/todo_actions';
import receiveSteps from '../../actions/step_actions';

import TodoDetailView from '../todo_list/todo_detail_view';

const mapDispatchtoProps = dispatch => ({
  removeTodo: () => dispatch(removeTodo(todo)),
});

export default connect(null, mapDispatchtoProps)(TodoDetailView);

