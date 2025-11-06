import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:couldai_user_app/screens/home_screen.dart';
import 'package:couldai_user_app/screens/tracking_screen.dart';
import 'package:couldai_user_app/screens/branch_locator_screen.dart';
import 'package:couldai_user_app/screens/contact_us_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSL Courier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          primary: Colors.red[700],
          secondary: Colors.grey[600]!,
          background: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    TrackingScreen(),
    BranchLocatorScreen(),
    ContactUsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Tracking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Branches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: 'Contact Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        unselectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
