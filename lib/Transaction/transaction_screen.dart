import 'package:flutter/material.dart';
import 'package:user1_bookingrepair/NavBar/custom_nav_bar.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {

  int _currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Your screen content here
        child: Text('Home Page Content'),
      ),
      bottomNavigationBar: CustomNavBar(
        activeIndex: _currentIndex,
        onTap: (v) {
          setState(() {
            _currentIndex = v; // Update the index on tap
          });
        },
      ),
    );
  }
}