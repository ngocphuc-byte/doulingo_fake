import 'package:doulingo_fake/data/provider/user_provider.dart';
import 'package:doulingo_fake/models/user_model.dart';

class UserRepo {
  Future createUserRepo(UserModel userModel){
    return UserProvider().createUserProvider(userModel);
  }
  Future signInRepo(UserModel userModel) async{
    return UserProvider().signInUserProvider(userModel);
  }
}