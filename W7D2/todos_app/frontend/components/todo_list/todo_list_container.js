import { connect } from 'react-redux';
import TodoList from './todo_list';
import { receiveTodo, createTodo, fetchTodos } from './../../actions/todo_actions';
import { allTodos } from './../../reducers/selectors';

const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  handleSubmit: (title, body) => dispatch(receiveTodo({ title, body })),
  fetchTodos: () => dispatch(fetchTodos()),
  createTodo: (todo) => dispatch(createTodo(todo))
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
