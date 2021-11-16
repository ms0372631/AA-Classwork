import { combineReducers } from 'redux';
import chirpsReducer from './chirps';
import sessionReducer from './session';

export default combineReducers({
  chirps: chirpsReducer,
});
