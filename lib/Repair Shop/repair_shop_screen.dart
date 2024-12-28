import 'package:flutter/material.dart';
import 'package:user1_bookingrepair/components/animated_circles.dart';

class RepairShopScreen extends StatefulWidget {
  const RepairShopScreen({super.key});

  @override
  State<RepairShopScreen> createState() => _RepairShopScreenState();
}

class _RepairShopScreenState extends State<RepairShopScreen> {
  // Async function to clean up resources when back button is pressed
  Future<bool> _onBackPressed() async {
    // Return true to allow default back navigation
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,  // Intercept back press and handle cleanup
      child: Scaffold(
        appBar: AppBar(
<<<<<<< HEAD
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'Shops Nearby',
              style: TextStyle(
                fontFamily: 'Inter Tight',
                color: Colors.black,
                fontSize: 22,
                letterSpacing: 0.0,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer Circle
                AnimatedScale(
                  duration: const Duration(seconds: 1),
                  scale: _scale,
                  child: Container(
                    width: screenWidth * 0.9, // 90% of screen width
                    height: screenWidth * 0.9, // Maintain circular shape
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.7),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                // Inner Circle
                AnimatedScale(
                  duration: const Duration(seconds: 1),
                  scale: _scale,
                  child: Container(
                    width: screenWidth * 0.6, // 60% of screen width
                    height: screenWidth * 0.6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.7),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                // Avatar
                Material(
                  elevation: 5, // Adjust the elevation value to your preference
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    radius: screenWidth * 0.2, // 20% of screen width
                    backgroundImage: const NetworkImage(
                      'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/zqBT16EdgLX9ToPwU6qhuY09QBI.jpg',
                    ),
                  ),
                ),

                // Navigate Button
                Align(
                  alignment: const AlignmentDirectional(0.01, 0.79),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const ShopList();
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04, // 4% of screen width
                        vertical: screenHeight * 0.02, // 2% of screen height
                      ),
                      backgroundColor: const Color(0xFF28435A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Navigate',
                      style: TextStyle(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomNavBar(
          activeIndex: _currentIndex,
          onTap: (v) {
            setState(() {
              _currentIndex = v;
            });
          },
=======
          title: const Text('Shops Nearby'),
>>>>>>> 3f90049 (upload)
        ),
        body: const AnimatedCircles(),
      ),
    );
  }
}
