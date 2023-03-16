import 'package:bloc/bloc.dart';
import 'package:doulingo_fake/data/repository/user_repo.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepo userRepo = UserRepo();
  late UserModel userModel = UserModel(
      username: '',
      password: '',
      createdAt: '',
      email: '',
      isOld: false,
      updatedAt: '');
  LoginBloc() : super(LoginInitial()) {
    on<SignUp>(_onSignUp);
    on<SignIn>(_onSignIn);
    on<SignOut>(_onSignOut);
  }

  Future _onSignUp(SignUp event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final user = await userRepo.createUserRepo(event.userModel);
    if (user is String) {
      emit(LoginError(error: user));
    } else {
      emit(LoginLoaded(userModel: user));
    }
  }

  Future _onSignIn(SignIn event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final user = await userRepo.signInRepo(event.userModel);
    if (user is String) {
      emit(LoginError(error: user));
    } else {
      emit(LoginLoaded(userModel: user));
    }
  }

  Future _onSignOut(SignOut event, Emitter<LoginState> emit) async {
    emit(LoginOut(userModel: userModel));
  }
}
