import 'package:bloc/bloc.dart';
import 'package:catalyst_technical_task/Features/AllUsers/Data/models/user_model.dart';
import 'package:catalyst_technical_task/Features/AllUsers/Data/repos/AllUserRepo.dart';
import 'package:equatable/equatable.dart';

part 'all_users_state.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  AllUsersCubit(this.allUserRepo) : super(AllUsersInitial());


  final AllUserRepo allUserRepo;

  Future <void> getAllUsers() async {
    try {
      emit(AllUsersLoading());
      final users = await allUserRepo.getAllUsers();
      emit(AllUsersSucess(users: users));
    } catch (e) {
      emit(AllUsersFailure(error: e.toString()));
    }
  }

  Future <void> getAllOwners() async {
    try {
      emit(AllOwnersLoading());
      final users = await allUserRepo.getAllOwners();
      emit(AllOwnersSucess(owners: users));
    } catch (e) {
      emit(AllOwnersFailure(error: e.toString()));
    }
  }
  Future <void> getAllAdmins() async {
    try {
      emit(AllAdminsLoading());
      final admins = await allUserRepo.getAllAdmins();
      emit(AllAdminsSucess(admins: admins));
    } catch (e) {
      emit(AllOwnersFailure(error: e.toString()));
    }
  }

  Future <void> getAllClients() async {
    try {
      emit(AllClientsLoading());
      final clients = await allUserRepo.getAllClients();
      emit(AllClientsSucess(clients: clients));
    } catch (e) {
      emit(AllClientsFailure(error: e.toString()));
    }
  }
  Future <void> createNewUser( {required Map<String, dynamic> body}) async {
    try {
      emit(CreateNewUserLoading());
      var newUser= await allUserRepo.createUsers(body: body);
      print(newUser);
      emit(CreateNewUserSucess());
    } catch (e) {
      emit(CreateNewUserFailure(error: e.toString()));
    }
  }

  Future <void> editUser( {required Map<String, dynamic> body}) async {
    try {
      emit(EditUserSucess());
      var updatedUser= await allUserRepo.updateUsers(body: body);
      print(updatedUser);
      emit(EditUserSucess());
    } catch (e) {
      emit(EditUserFailure(error: e.toString()));
    }
  }

  Future <void> deleteUser( {required String id}) async {
    try {
      emit(EditUserSucess());
      var updatedUser= await allUserRepo.deleteUsers(id: id);
      print(updatedUser);
      emit(EditUserSucess());
    } catch (e) {
      emit(EditUserFailure(error: e.toString()));
    }
  }
}
