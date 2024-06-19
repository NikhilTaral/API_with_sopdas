abstract class SignInState {}


class SignInInitialState extends SignInState {}

class SignInValidState extends SignInState {}

class SignInErrorState extends SignInState {

  final String ErrorMessage;
  SignInErrorState(this.ErrorMessage);
}


class SignInLoadingState extends SignInState {}
