import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/Data/models/user_model.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/presentation/views/EditUser.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditUser(user: user)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 100,
        child: Row(
          children: [
            const SizedBox(width: 8),
            ClipOval(
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.profileImage!),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      
                      'Name : ${user.name}',
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).width * 0.04),
                    ),
                    Text('Role : ${user.role}'),
                    Text('Phone : ${user.phone}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
