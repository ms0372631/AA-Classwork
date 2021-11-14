import {connect} from 'react-redux';
import { receiveStep, removeStep } from '../../actions/step_actions';
import { stepsByTodoId } from '../../reducers/selectors';

const mapStatetoProps = (state, todoId) => {
  return {
    steps: stepsByTodoId(state, todoId)
  };
};

const mapDispatchtoProps = dispatch => ({
  receiveStep: step => dispatch(receiveStep(step)),
  removeStep: step => dispatch(removeStep(step))
});

const StepListContainer = connect(mapStatetoProps, mapDispatchtoProps)(step_list);

export default StepListContainer;