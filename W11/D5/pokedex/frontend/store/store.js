import { createStore, applyMiddleware } from "redux";
import rootReducer from "../reducers/root_reducer";
import logger from "redux-logger";

const configureStore = () => {
  return (
    createStore(rootReducer, applyMiddleware(logger))
  )
}

export default configureStore