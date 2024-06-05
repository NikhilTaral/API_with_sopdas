abstract class SignInState {}

//This SignInInitialState class is to Initialize state
class SignInInitialState extends SignInState {}

//This SignInValidState class is to Validate state
class SignInValidState extends SignInState {}

//This SignInErrorState class is to Error state
class SignInErrorState extends SignInState {
  // ignore: non_constant_identifier_names
  final String ErrorMessage;
  SignInErrorState(this.ErrorMessage);
}

//This SignInLoadingState class is to Error state
class SignInLoadingState extends SignInState {}
