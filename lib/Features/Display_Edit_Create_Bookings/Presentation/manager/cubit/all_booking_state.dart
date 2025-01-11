part of 'all_booking_cubit.dart';

sealed class AllBookingState extends Equatable {
  const AllBookingState();

  @override
  List<Object> get props => [];
}

final class AllBookingInitial extends AllBookingState {}
final class AllBookingLoading extends AllBookingState {}

final class AllBookingSucess extends AllBookingState {
  final List<BookingModel> bookings;

  const AllBookingSucess({required this.bookings});
}

final class AllBookingFailuer extends AllBookingState {
   final String error;

 const AllBookingFailuer({required this.error});  
}

final class CreateBookingLoading extends AllBookingState {}

final class CreateBookingSucsess extends AllBookingState {
}

final class CreateBookingFailure extends AllBookingState {
  final String error;

 const CreateBookingFailure({required this.error});
}