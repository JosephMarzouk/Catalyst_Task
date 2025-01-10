import 'package:catalyst_technical_task/Features/AllUsers/presentation/widgets/UserCard.dart';
import 'package:flutter/material.dart';

class UsersListView extends StatelessWidget {
  final List<dynamic> users;

  const UsersListView({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: UserCard(
            user: users[index],
          ),
        );
      },
    );
  }
}
