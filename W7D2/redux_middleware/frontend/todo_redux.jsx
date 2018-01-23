import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { createStore, applyMiddleware } from 'redux';
import rootReducer from './reducers/root_reducer';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
  JSON.parse(localStorage.state) : {};

  const store = createStore(rootReducer, preloadedState,
                applyMiddleware(addLoggingToDispatch));

  // let store = configureStore(preloadedState);
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};

// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// };
