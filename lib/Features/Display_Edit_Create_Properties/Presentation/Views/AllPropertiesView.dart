// import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Data/models/properties_model/properties_model.dart';
// import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/Widgets/PropertyCard.dart';
// import 'package:flutter/material.dart';

// class PropertiesPage extends StatelessWidget {
//   final List<PropertiesModel> properties;

//   const PropertiesPage({Key? key, required this.properties}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Properties'),
//         centerTitle: true,
//       ),
//       body: properties.isEmpty
//           ? const Center(
//               child: Text(
//                 'No properties available.',
//                 style: TextStyle(fontSize: 16),
//               ),
//             )
//           : ListView.builder(
//               itemCount: properties.length,
//               itemBuilder: (context, index) {
//                 return PropertyCard(property: properties[index]);
//               },
//             ),
//     );
//   }
// }

import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/manager/cubit/properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/Widgets/PropertiesList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertiesPage extends StatelessWidget {
  const PropertiesPage({super.key});

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<PropertiesCubit>(context).getProperties();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const CreateNewProperty()),
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
