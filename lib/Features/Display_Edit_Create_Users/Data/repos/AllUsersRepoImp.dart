import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/Data/models/user_model.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/Data/repos/AllUserRepo.dart';
import 'package:catalyst_technical_task/core/APIservice.dart';

class AllUsersRepoImp implements AllUserRepo {
  final ApiService apiService;
  AllUsersRepoImp(this.apiService);

  @override
  Future<List<UserModel>> createUsers(
      {required Map<String, dynamic> body}) async {
    try {
      var data = await apiService.post(endPoint: 'users', body: body);
      print(data);
      return (data as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<List<UserModel>> deleteUsers({required String id}) async{
    try {
      var data = await apiService.delete(endPoint: 'users',id: id);
      print(data);
      return (data as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getAllAdmins() async {
    try {
      var data = await apiService.get(endPoint: 'users');
      List<UserModel> admins = [];
      for (var user in data) {
        if (user['role'] == 'admin') {
          admins.add(UserModel.fromJson(user));
        }
      }
      return admins;
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getAllClients() async {
    try {
      var data = await apiService.get(endPoint: 'users');
      List<UserModel> clients = [];
      for (var user in data) {
        if (user['role'] == 'client') {
          clients.add(UserModel.fromJson(user));
        }
      }
      return clients;
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getAllOwners() async {
    try {
      var data = await apiService.get(endPoint: 'users');
      List<UserModel> owners = [];
      for (var user in data) {
        if (user['role'] == 'owner') {
          owners.add(UserModel.fromJson(user));
        }
      }
      return owners;
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      var data = await apiService.get(endPoint: 'users');
      List<UserModel> users = [];
      for (var user in data) {
        users.add(UserModel.fromJson(user));
      }
      return users;
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<List<UserModel>> updateUsers(
      {required Map<String, dynamic> body, required String id}) async {
    try {
      var data = await apiService.edit(endPoint: 'users', body: body, id: id);
      print(data);
      return (data as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      print(e);

      rethrow;
    }
  }
  
}
