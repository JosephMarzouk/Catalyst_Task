import 'package:catalyst_technical_task/Features/AllUsers/presentation/manager/cubit/all_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Radiobuttons extends StatefulWidget {
  const Radiobuttons({super.key});

  @override
  State<Radiobuttons> createState() => _RadiobuttonsState();
}

class _RadiobuttonsState extends State<Radiobuttons> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: const Text(' All Users'),
          leading: Radio<String>(
            value: 'All users',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                BlocProvider.of<AllUsersCubit>(context).getAllUsers();
                _selectedOption = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text(' Owners'),
          leading: Radio<String>(
            value: 'Owners',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
                BlocProvider.of<AllUsersCubit>(context).getAllOwners();
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Admins'),
          leading: Radio<String>(
            value: 'Admins',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                BlocProvider.of<AllUsersCubit>(context).getAllAdmins();
                _selectedOption = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Clients'),
          leading: Radio<String>(
            value: 'Clients',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                BlocProvider.of<AllUsersCubit>(context).getAllClients();
                _selectedOption = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
