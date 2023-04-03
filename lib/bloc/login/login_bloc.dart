import 'package:bloc/bloc.dart';
import 'package:doulingo_fake/data/provider/user_provider.dart';
import 'package:doulingo_fake/data/repository/user_repo.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepo userRepo = UserRepo();
  BaseURL baseURL = BaseURL();
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
    on<SignInGoogle>(_onSignInGoogle);
    on<UpdateImage>(_onUpdateImage);
  }

  Future _onSignUp(SignUp event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final user = await userRepo.signInAuthRepo(
        event.userModel, baseURL.userAuthSignUpURL);
    if (user is String) {
      emit(LoginError(error: user));
    } else {
      emit(LoginLoaded(userModel: user));
    }
  }

  Future _onSignIn(SignIn event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final user = await userRepo.signInAuthRepo(
        event.userModel, baseURL.userAuthSignInURL);
    if (user is String) {
      emit(LoginError(error: user));
    } else {
      emit(LoginLoaded(userModel: user));
    }
  }

  Future _onSignOut(SignOut event, Emitter<LoginState> emit) async {
    final loginBox = Hive.box('login');
    print(loginBox.deleteAt(0));
    emit(LoginOut(userModel: userModel));
  }

  Future _onSignInGoogle(SignInGoogle event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final user = await userRepo.signInAuthRepo(
        event.userModel, baseURL.userAuthGoogleURL);
    emit(LoginLoaded(userModel: user));
  }

  Future _onUpdateImage(UpdateImage event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final user = await userRepo.updateImageRepo(image: event.image);

    emit(LoginLoaded(userModel: user));
  }
}
