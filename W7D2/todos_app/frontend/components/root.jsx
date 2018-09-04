import React from 'react';
import { Provider } from 'react-redux';
import TodoApp from './todo_redux';

const Root = ({ store }) => {
  return (
    <Provider store={store}>
      <TodoApp />
    </Provider>
  );
};

export default Root;
