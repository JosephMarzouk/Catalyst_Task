
import 'package:flutter/material.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/Widgets/PropertiesList.dart';

class AllPropertiesView extends StatelessWidget {
  const AllPropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: PropertiesList(),
      ),
      
    );
  }
}
