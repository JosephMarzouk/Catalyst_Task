import 'package:flutter/material.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Data/models/properties_model/properties_model.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/Widgets/PropertyCard.dart';

class PropertiesListView extends StatelessWidget {
  final List<PropertiesModel> properties;

  const PropertiesListView({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: properties.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: PropertyCard(
            property: properties[index],
          ),
        );
      },
    );
  }
}
