part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoading extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoaded extends LoginState{
  UserModel userModel;
  LoginLoaded({required this.userModel});
  
  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}
class LoginOut extends LoginState{
  UserModel userModel;
  LoginOut({required this.userModel});
  
  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

class LoginError extends LoginState{
  String error;
  LoginError({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

