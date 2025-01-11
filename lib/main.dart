import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Data/repos/AllBookingRepoImp.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Presentation/manager/cubit/all_booking_cubit.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Data/repos/AllPropertiesRepoImp.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/manager/cubit/properties_cubit.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/Data/repos/AllUsersRepoImp.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/presentation/manager/cubit/all_users_cubit.dart';
import 'package:catalyst_technical_task/DefultView.dart';
import 'package:catalyst_technical_task/core/ServiceLocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SetupServiceLocator();
  runApp(const CatalystApp());
}

class CatalystApp extends StatelessWidget {
  const CatalystApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllUsersCubit>(
          create: (context) => AllUsersCubit(getIt.get<AllUsersRepoImp>()),
        ),
        BlocProvider<AllBookingCubit>(
          create: (context) => AllBookingCubit(getIt.get<AllBookingRepoImp>()),
        ),
        BlocProvider<PropertiesCubit>(
          create: (context) => PropertiesCubit(getIt.get<AllPropertiesRepoImp>()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefultView(),
      ),
    );
  }
}
