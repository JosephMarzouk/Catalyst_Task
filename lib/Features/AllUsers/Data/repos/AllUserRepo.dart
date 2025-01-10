import 'package:catalyst_technical_task/Features/AllUsers/Data/models/user_model.dart';

abstract class AllUserRepo {
  Future<List<UserModel>> getAllUsers();
  Future<List<UserModel>> getAllAdmins();
  Future<List<UserModel>> getAllOwners();
  Future<List<UserModel>> getAllClients();
  Future<List<UserModel>> createUsers({required Map<String, dynamic> body});
  Future<List<UserModel>> updateUsers({required Map<String, dynamic> body});
  Future<List<UserModel>> deleteUsers({required String id});
}
