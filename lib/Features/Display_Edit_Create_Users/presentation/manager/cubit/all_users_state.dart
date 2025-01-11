part of 'all_users_cubit.dart';

sealed class AllUsersState extends Equatable {
  const AllUsersState();

  @override
  List<Object> get props => [];
}

final class AllUsersInitial extends AllUsersState {}

final class AllUsersSucess extends AllUsersState {
  final List<UserModel> users;

  const AllUsersSucess({required this.users});
}

final class AllUsersFailure extends AllUsersState {
  final String error;

  const AllUsersFailure({required this.error});
}

final class AllUsersLoading extends AllUsersState {}

final class AllOwnersLoading extends AllUsersState {}

final class AllOwnersSucess extends AllUsersState {
  final List<UserModel> owners;

  const AllOwnersSucess({required this.owners});
}

final class AllOwnersFailure extends AllUsersState {
  final String error;

  const AllOwnersFailure({required this.error});
}

final class AllAdminsLoading extends AllUsersState {}

final class AllAdminsSucess extends AllUsersState {
  final List<UserModel> admins;

  const AllAdminsSucess({required this.admins});
}

final class AllAdminsFailure extends AllUsersState {
  final String error;

  const AllAdminsFailure({required this.error});
}

final class AllClientsLoading extends AllUsersState {}

final class AllClientsSucess extends AllUsersState {
  final List<UserModel> clients;

  const AllClientsSucess({required this.clients});
}

final class AllClientsFailure extends AllUsersState {
  final String error;

  const AllClientsFailure({required this.error});
}

final class CreateNewUserLoading extends AllUsersState {}

// ignore: must_be_immutable
final class CreateNewUserSucess extends AllUsersState {}

final class CreateNewUserFailure extends AllUsersState {
  final String error;

  const CreateNewUserFailure({required this.error});
}

final class EditUserLoading extends AllUsersState {}

// ignore: must_be_immutable
final class EditUserSucess extends AllUsersState {}

final class EditUserFailure extends AllUsersState {
  final String error;

  const EditUserFailure({required this.error});
}
