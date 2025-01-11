import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Presentation/manager/cubit/all_booking_cubit.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Presentation/views/AllBookingView.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/Views/AllPropertiesView.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/manager/cubit/properties_cubit.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/presentation/views/AllUsersView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class DefultView extends StatefulWidget {
  const DefultView({super.key});

  @override
  State<DefultView> createState() => _HomeViewState();
}

class _HomeViewState extends State<DefultView> {
  int _currentindex = 0;
  List <Widget>views=<Widget>[const AllUsersView(),const AllBookingsView(), const AllPropertiesView()];  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: Container(
        
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.3))),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: GNav(
            
            tabBackgroundColor: Colors.redAccent.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            backgroundColor: Colors.white,
            activeColor: Colors.redAccent,
            gap: 8,
            selectedIndex: _currentindex ,
            onTabChange: (index) {
              setState(() {
                _currentindex=index;
              });
            },
            tabs: [
              const GButton(
                text: 'Users',
                icon: Icons.person_3_rounded,
                
              ),
              GButton(
               onPressed: (){
 BlocProvider.of<AllBookingCubit>(context).getAllBookings();
               },
                icon: Icons.book,
                text: 'Bookings',
              ),
              GButton(
               onPressed: (){
                 BlocProvider.of<PropertiesCubit>(context).getProperties();
               },
                icon: Icons.featured_play_list,
                text: 'Properties',
              ),
              
            ],
          ),
        ),
      ),
      
      body: views.elementAt(_currentindex),
    );
    
  }
 
} 