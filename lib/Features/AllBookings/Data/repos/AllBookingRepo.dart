import 'package:catalyst_technical_task/Features/AllBookings/Data/models/booking_model/booking_model.dart';

abstract class AllBookingRepo{
  Future<List<BookingModel>> getAllBookings();
  Future<List<BookingModel>> createBookings({required Map<String, dynamic> body});
  Future<List<BookingModel>> updateBookings({required Map<String, dynamic> body});
  Future<List<BookingModel>> deleteBookings();
}