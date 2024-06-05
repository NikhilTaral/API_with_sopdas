abstract class SignInEvent {}

//This SignInTextChangedEvent class is used when the Text Input fields changed
//this event is called when Text Input fields values changed
//email & password values
class SignInTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

//This SignInSubmittedEvent class is used when the Text Input values submitted
//this event is called when Text Input fields values submitted
//actual email & password
class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent(this.email, this.password);
}
