import React from 'react';
import GreetingContainer from './greeting_container';
import LoginFormContainer from './login_form_container';
import SignupFormContainer from './signup_form_container';
import { Route } from 'react-router-dom';
import AuthRoute from '../util/route_util';
import { connect } from 'react-redux';
import { logout } from '../actions/session_actions';

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>
    <Route path="/login" component={LoginFormContainer} />
    <Route path="/signup" component={SignupFormContainer} />
  </div>
);

// const mapStateToProps = state => ({
//   loggedIn: Boolean(state.session.id),
//   user: state.entities.users[state.session.id],
// });
//
// const mapDispatchToProps = dispatch => {
//   return {
//     logout: () => dispatch(logout())
//   };
// };
//
// export default connect(mapStateToProps, mapDispatchToProps)(App);

export default App;
