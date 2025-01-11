import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/Data/models/user_model.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/presentation/manager/cubit/all_users_cubit.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/presentation/widgets/CustomFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUser extends StatelessWidget {
  final UserModel user;


  final TextEditingController newNameController = TextEditingController();
  final TextEditingController newEmailController = TextEditingController();
  final TextEditingController newPhoneController = TextEditingController();

  EditUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 90.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${user.name}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Email: ${user.email}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Phone: ${user.phone}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Role: ${user.role}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: ClipOval(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(user.profileImage?? 'https://via.placeholder.com/150'),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                
                CustomFormField(
                  label: 'New Name',
                  controller: newNameController,
                ),
                const SizedBox(height: 20),

                
                CustomFormField(
                  label: 'New Email',
                  controller: newEmailController,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!value.contains('@')) {
                        return 'Invalid email format';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                
                CustomFormField(
                  label: 'New Phone',
                  controller: newPhoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 30),

               
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AllUsersCubit>(context).editUser(
                        id: user.id.toString(),
                        body: 
                      {
                        'id': user.id,
                        'name': newNameController.text.isNotEmpty ? newNameController.text : user.name,
                        'email': newEmailController.text.isNotEmpty ? newEmailController.text : user.email,
                        'phone': newPhoneController.text.isNotEmpty ? newPhoneController.text : user.phone,
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Submit changes'),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // AlertDialog(
                      //   title: const Text('Delete User'),
                      //   content: const Text('Are you sure you want to delete this user?'),
                      //   actions: [
                      //     TextButton(
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //       child: const Text('Cancel'),
                      //     ),
                      //     TextButton(
                      //       onPressed: () {
                      //         BlocProvider.of<AllUsersCubit>(context).deleteUser(
                      //           id: user.id.toString(),
                      //         );
                      //         Navigator.pop(context);
                      //       },
                      //       child: const Text('Delete User'),
                      //     ),
                      //   ],
                      // );
                      
                      BlocProvider.of<AllUsersCubit>(context).deleteUser(
                        id: user.id.toString(),
                     );
                     
                      Navigator.pop(context);
                    },
                    
                    child: const Text('Delete User'),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
