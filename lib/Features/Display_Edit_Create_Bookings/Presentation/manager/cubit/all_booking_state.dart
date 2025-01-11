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

final class CreateBookingSucsess extends AllBookingState {}

final class CreateBookingFailure extends AllBookingState {
  final String error;

  const CreateBookingFailure({required this.error});
}


final class DeleteBookingLoading extends AllBookingState {}

final class DeleteBookingSucsess extends AllBookingState {}

final class DeleteBookingFailure extends AllBookingState {
  final String error;

  const DeleteBookingFailure({required this.error});
}

final class UpdateBookingLoading extends AllBookingState {}

final class UpdateBookingSucsess extends AllBookingState {}

final class UpdateBookingFailure extends AllBookingState {
  final String error;

  const UpdateBookingFailure({required this.error});
}