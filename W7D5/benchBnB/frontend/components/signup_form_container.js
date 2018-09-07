import { connect } from 'react-redux';
import { signup } from '../actions/session_actions';
import { withRouter } from 'react-router-dom';
import SessionForm from './session_form';

const mapStateToProps = state => ({
  buttonText: 'Sign Up',
  errors: state.errors.session
});

const mapDispatchToProps = dispatch => {
  return {
    formAction: (user) => dispatch(signup(user))
  };
};

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(SessionForm));
