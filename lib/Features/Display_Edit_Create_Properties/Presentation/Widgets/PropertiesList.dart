import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/manager/cubit/properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/Widgets/PropertiesListView.dart';

class PropertiesList extends StatelessWidget {
  const PropertiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertiesCubit, PropertiesState>(
      builder: (context, state) {
        if (state is GetAllPropertiesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GeatAllPropertiesSuccess) {
          return PropertiesListView(properties: state.properties);
        } else if (state is GetAllPropertiesFailuer) {
          return Center(
            child: Text(state.error),
          );
        }
        return const SizedBox();
      },
    );
  }
}
