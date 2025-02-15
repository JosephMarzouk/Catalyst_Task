import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/presentation/widgets/RadioButtons.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/presentation/widgets/UsersList.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/presentation/views/CreateNewUser.dart';
import 'package:flutter/material.dart';

class AllUsersView extends StatelessWidget {
  const AllUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Users'),
        centerTitle: true,
        elevation: 0,
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: const Radiobuttons(),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height *0.449,
              child: UsersList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateNewUser()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
