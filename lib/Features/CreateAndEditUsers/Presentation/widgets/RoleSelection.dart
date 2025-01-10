import 'package:flutter/material.dart';

class RoleSelection extends StatelessWidget {
  final String? selectedRole;
  final Function(String?) onRoleChanged;

  const RoleSelection({
    required this.selectedRole,
    required this.onRoleChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Role:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ListTile(
          title: const Text('Admin'),
          leading: Radio<String>(
            value: 'admin',
            groupValue: selectedRole,
            onChanged: onRoleChanged,
          ),
        ),
        ListTile(
          title: const Text('Client'),
          leading: Radio<String>(
            value: 'client',
            groupValue: selectedRole,
            onChanged: onRoleChanged,
          ),
        ),
        ListTile(
          title: const Text('Owner'),
          leading: Radio<String>(
            value: 'owner',
            groupValue: selectedRole,
            onChanged: onRoleChanged,
          ),
        ),
        if (selectedRole == null)
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(
              'Please select a role',
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
