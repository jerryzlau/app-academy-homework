import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

// const addLoggingToDispatch = (store) => {
//   const doSomething = store.dispatch;
//   return(action) => {
//     console.log(store.getState());
//     console.log(action);
//     doSomething(action);
//     console.log(store.getState());
//   };
// };

const addLoggingToDispatch = store => next => action => {
  console.log('State pre-dispatch:', store.getState());
  console.log('Action received:', action);
  next(action);
  console.log('State post-dispatch:', store.getState());
};

const applyMiddlewares = (store, ...middleWares) => {
  let dispatch = store.dispatch;
  middleWares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, {dispatch});
};

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store);
  store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// export default addLoggingToDispatch;
