
import 'package:catalyst_technical_task/Features/AllBookings/Data/repos/AllBookingRepoImp.dart';
import 'package:catalyst_technical_task/Features/AllBookings/Presentation/manager/cubit/all_booking_cubit.dart';
import 'package:catalyst_technical_task/Features/AllBookings/Presentation/views/AllBookingView.dart';
import 'package:catalyst_technical_task/Features/AllUsers/Data/repos/AllUsersRepoImp.dart';
import 'package:catalyst_technical_task/Features/AllUsers/presentation/manager/cubit/all_users_cubit.dart';
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
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AllBookingsView(),
      ),
    );
  }
}
