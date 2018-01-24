import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import rootReducer from '../reducers/root_reducer';

const initialState = {
  giphys: []
};

const configureStore = () => {
  return createStore(rootReducer, initialState, applyMiddleware(thunk));
};

export default configureStore;
