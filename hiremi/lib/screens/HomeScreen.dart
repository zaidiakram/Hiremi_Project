import 'package:flutter/material.dart';
import '../Widget/carouselSection.dart';
import '../Widget/customAppBar.dart';
import '../Widget/customBottomNavbar.dart';
import '../Widget/customDrawer.dart';
import '../Widget/featuredGrid.dart';
import '../Widget/jobsForYouSection.dart';
import '../Widget/verificationCard.dart';
import 'askExpertScreen.dart';
import 'hiremi360Screen.dart';
import 'jobsScreen.dart';
import 'statusScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    SingleChildScrollView(
      child: Column(
        children: [
          VerificationSection(),
          CarouselSection(),
          FeaturedSection(),
          JobsForYouSection(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ),

    const JobsScreen(),
    const AskExpertScreen(),
    const StatusScreen(),
    const Hiremi360Screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
