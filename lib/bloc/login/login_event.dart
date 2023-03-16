part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class SignUp extends LoginEvent {
  UserModel userModel;
  SignUp({required this.userModel});
  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

class SignIn extends LoginEvent {
  UserModel userModel;
  SignIn({required this.userModel});
  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

class SignOut extends LoginEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
