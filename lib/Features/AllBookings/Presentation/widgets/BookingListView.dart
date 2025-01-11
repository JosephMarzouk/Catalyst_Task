import 'package:catalyst_technical_task/Features/AllBookings/Data/models/booking_model/booking_model.dart';
import 'package:catalyst_technical_task/Features/AllBookings/Presentation/widgets/BookingCard.dart';
import 'package:flutter/material.dart';

class BookingListView extends StatelessWidget {
  final List<BookingModel> bookings;

  const BookingListView({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: BookingCard(
            booking: bookings[index],
          ),
        );
      },
    );
  }
}
