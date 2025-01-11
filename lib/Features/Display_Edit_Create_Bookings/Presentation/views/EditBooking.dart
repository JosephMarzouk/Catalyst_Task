import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Data/models/booking_model/booking_model.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Presentation/manager/cubit/all_booking_cubit.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/presentation/widgets/CustomFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditBooking extends StatelessWidget {
  final BookingModel booking;

  final TextEditingController newNameController = TextEditingController();
  final TextEditingController newEmailController = TextEditingController();
  final TextEditingController newPhoneController = TextEditingController();

  EditBooking({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
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
                            'start date: ${booking.startDate}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'End date: ${booking.endDate}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'User name: ${booking.user?.name}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'property name: ${booking.property?.name}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
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
                      BlocProvider.of<AllBookingCubit>(context)
                          .editBooking(id: booking.id.toString(), body: {
                        'id': booking.id,
                        'user name': newNameController.text.isNotEmpty
                            ? newNameController.text
                            : booking.user?.name,
                        'property ID': newEmailController.text.isNotEmpty
                            ? newEmailController.text
                            : booking.property?.id,
                        'phone number': newPhoneController.text.isNotEmpty
                            ? newPhoneController.text
                            : booking.user?.phone,
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

                      BlocProvider.of<AllBookingCubit>(context).deleteBooking(
                        id: booking.id.toString(),
                      );

                      Navigator.pop(context);
                    },
                    child: const Text('Delete Booking'),
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
