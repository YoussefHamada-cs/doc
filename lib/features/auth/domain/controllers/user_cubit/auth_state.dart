class AuthState {}

final class AuthInitial extends AuthState {}

final class LoadingLogIn extends AuthState {}

final class SuccessLogIn extends AuthState {}

final class FailureLogIn extends AuthState {
  final String errorMessage;

  FailureLogIn({required this.errorMessage});
}
