import 'package:Medkit/screens/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static List<Widget> _widgetOptions =[
    Dashboard(),
    Center(
      child: Text('Medications'),
    )
  ];

  List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/dashboard.svg'),
      activeIcon: SvgPicture.asset('assets/icons/dashboard_active.svg', width: 30, height: 30,),
      title: Text('Dashboard'),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/carbon_pills.svg'),
      activeIcon: SvgPicture.asset('assets/icons/carbon_pills_active.svg', width: 30, height: 30,),
      title: Text('Medications')
    )
  ];

  int _selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: _navBarItems,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}