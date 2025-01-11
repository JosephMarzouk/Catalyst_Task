import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Data/models/booking_model/booking_model.dart';

abstract class AllBookingRepo {
  Future<List<BookingModel>> getAllBookings();
  Future<List<BookingModel>> createBooking(
      {required Map<String, dynamic> body});
  Future<List<BookingModel>> updateBookings(
      {required Map<String, dynamic> body,required String id});
  Future<List<BookingModel>> deleteBookings({required String id});
}
