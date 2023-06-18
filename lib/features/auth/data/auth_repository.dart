import '../models/user.dart';
import 'auth_datasource.dart';

class AuthRepository {
  final AuthDatasource _datasource = AuthDatasource();
  Future<User> login({required String email, required String password}) {
    return _datasource.login(email: email, password: password);
  }
}
