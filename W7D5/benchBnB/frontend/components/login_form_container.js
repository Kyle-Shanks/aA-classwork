import { connect } from 'react-redux';
import { login } from '../actions/session_actions';
import { withRouter } from 'react-router-dom';
import SessionForm from './session_form';

const mapStateToProps = state => ({
  buttonText: 'Log In',
  errors: state.errors.session
});

const mapDispatchToProps = dispatch => {
  return {
    formAction: (user) => dispatch(login(user))
  };
};

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(SessionForm));
