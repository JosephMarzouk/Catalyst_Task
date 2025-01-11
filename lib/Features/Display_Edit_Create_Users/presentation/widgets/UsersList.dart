import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/presentation/widgets/UsersListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cubit/all_users_cubit.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllUsersCubit, AllUsersState>(
      builder: (context, state) {
        if (state is AllUsersLoading ||
            state is AllClientsLoading ||
            state is AllOwnersLoading ||
            state is AllAdminsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AllUsersSucess) {
          return UsersListView(users: state.users);
        } else if (state is AllOwnersSucess) {
          return UsersListView(users: state.owners);
        } else if (state is AllAdminsSucess) {
          return UsersListView(users: state.admins);
        } else if (state is AllClientsSucess) {
          return UsersListView(users: state.clients);
        } else if (state is AllUsersFailure) {
          return Center(
            child: Text(state.error),
          );
        }
        return const SizedBox();
      },
    );
  }
}
