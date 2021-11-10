import { createStore } from "redux";
import rootReducer from '../reducers/root_reducer';

// const store = createStore(rootReducer);

const configureStore = (preloadedState = {}) => {
  console.log('example')
  return createStore(rootReducer, preloadedState);
};

export default configureStore;


