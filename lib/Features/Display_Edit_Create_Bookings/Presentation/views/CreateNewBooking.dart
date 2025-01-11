import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Presentation/manager/cubit/all_booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewBooking extends StatefulWidget {
  const CreateNewBooking({super.key});

  @override
  State<CreateNewBooking> createState() => _CreateNewBookingState();
}

class _CreateNewBookingState extends State<CreateNewBooking> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for the input fields
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController propertyIdController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();


  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text =
            picked.toIso8601String().split('T')[0]; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Booking'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                TextFormField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    labelText: 'User ID',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'User ID is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                TextFormField(
                  controller: propertyIdController,
                  decoration: const InputDecoration(
                    labelText: 'Property ID',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Property ID is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                TextFormField(
                  controller: startDateController,
                  decoration: InputDecoration(
                    labelText: 'Start Date',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () =>
                          _selectDate(context, startDateController),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Start Date is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                TextFormField(
                  controller: endDateController,
                  decoration: InputDecoration(
                    labelText: 'End Date',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context, endDateController),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'End Date is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AllBookingCubit>(context)
                          .createBooking(
                        body: {
                          "user_id": userIdController.text,
                          "property_id": propertyIdController.text,
                          "start_date": startDateController.text,
                          "end_date": endDateController.text,
                        },
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Booking created successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Navigator.pop(context);
                    },
                    child: const Text('Create Booking'),
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
