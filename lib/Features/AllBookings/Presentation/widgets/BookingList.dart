import 'package:catalyst_technical_task/Features/AllBookings/Presentation/manager/cubit/all_booking_cubit.dart';
import 'package:catalyst_technical_task/Features/AllBookings/Presentation/widgets/BookingListView.dart';
import 'package:catalyst_technical_task/Features/AllUsers/presentation/widgets/UsersListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBookingCubit, AllBookingState>(
      builder: (context, state) {
        if (state is AllBookingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AllBookingSucess) {
          return BookingListView(bookings: state.bookings);
        }  else if (state is AllBookingFailuer) {
          return Center(
            child: Text(state.error),
          );
        }
        return const SizedBox();
      },
    );
  }
}
