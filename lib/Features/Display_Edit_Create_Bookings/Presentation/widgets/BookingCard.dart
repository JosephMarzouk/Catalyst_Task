import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Data/models/booking_model/booking_model.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;

  const BookingCard({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    booking.status?.toUpperCase() ?? "Unknown",
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor:
                      booking.status == 'canceled' ? Colors.red : Colors.green,
                ),
                Text(
                  'Booking ID: ${booking.id ?? "N/A"}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: booking.user?.profileImage != null &&
                          booking.user!.profileImage!.isNotEmpty
                      ? NetworkImage(booking.user!.profileImage!)
                      : null,
                  child: booking.user?.profileImage == null ||
                          booking.user!.profileImage!.isEmpty
                      ? const Text(
                          'No Image',
                          style: TextStyle(fontSize: 10),
                        )
                      : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.user?.name ?? 'No name',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        booking.user?.email ?? 'No email',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        booking.user?.phone?.isNotEmpty == true
                            ? booking.user!.phone!
                            : 'No phone number',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                if (booking.property?.images != null &&
                    booking.property!.images!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      booking.property!.images!
                          .replaceAll('[', '')
                          .replaceAll(']', '')
                          .split(',')
                          .first
                          .replaceAll('"', '')
                          .trim(),
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  )
                else
                  Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                    ),
                    child: const Text(
                      'No Image\nProvided',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.property?.name ?? 'No property name',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        booking.property?.location ?? 'No location provided',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        booking.property?.price != null
                            ? '\$${booking.property!.price} / night'
                            : 'Price not available',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.date_range, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  '${booking.startDate ?? "Unknown"} - ${booking.endDate ?? "Unknown"}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
