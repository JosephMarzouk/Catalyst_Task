// import 'package:catalyst_technical_task/Features/AllBookings/Data/models/booking_model/booking_model.dart';
// import 'package:catalyst_technical_task/Features/AllBookings/Presentation/manager/cubit/all_booking_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../widgets/BookingCard.dart';

// class AllBookingsView extends StatelessWidget {
//   final List<BookingModel> bookings;

//   const AllBookingsView({Key? key, required this.bookings}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('All Bookings'),
//         centerTitle: true,
//       ),
//       body: bookings.isEmpty
//           ?  Center(
//               child: GestureDetector(
//                 onTap:(){
//                   BlocProvider.of<AllBookingCubit>(context).getAllBookings();
//                 } ,
//                 child: const Text(
//                   'No bookings available.',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             )
//           : ListView.builder(
//               itemCount: bookings.length,
//               itemBuilder: (context, index) {
//                 return BookingCard(booking: bookings[index]);
//               },
//             ),
//     );
//   }
// }
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Presentation/manager/cubit/all_booking_cubit.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Presentation/views/CreateNewBooking.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Presentation/widgets/BookingListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBookingsView extends StatelessWidget {
  const AllBookingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Bookings'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateNewBooking()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<AllBookingCubit, AllBookingState>(
        builder: (context, state) {
          if (state is AllBookingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AllBookingSucess) {
            return BookingListView(bookings: state.bookings);
          } else if (state is AllBookingFailuer) {
            return Center(
              child: Column(
                children: [
                  Text(
                    'Failed to load bookings. Tap to retry.\nError: ${state.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<AllBookingCubit>(context).getAllBookings();
              },
              child: const Text(
                'No bookings available.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
