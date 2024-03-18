part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
}

class SignUpUser extends AuthenticationEvent {
  UserModel userModel = UserModel();

  SignUpUser(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class SignInUser extends AuthenticationEvent {
  UserModel userModel = UserModel();

  SignInUser(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class RegisterUserToDB extends AuthenticationEvent {
  UserModel userModel = UserModel();

  RegisterUserToDB(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class SignOut extends AuthenticationEvent {}
