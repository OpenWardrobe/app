import 'package:flutter/material.dart';
// import  waardrobe service from this project
import 'package:openwardrobe/ui/widgets/dashboard/link.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Welcome, username and profile picture
        title: const Text('Home'),

      ),
      body: Align(
  alignment: Alignment.topCenter, // Houdt de items bovenaan en gecentreerd horizontaal
  child: Column(
    // DashboardLink
    children: [
      // Max width for row
      
    ConstrainedBox(constraints: BoxConstraints(maxWidth: 500),
    child: 
      // Make a row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DashboardLink(
        text: 'Upload Items',
        icon: Icons.add,
        color: Colors.blue,
        onTap: () {
        },
      ),
      DashboardLink(
        text: 'Create Outfit',
        color: Colors.red,
        icon: Icons.list,
        onTap: () {
        },
      ),
      DashboardLink(
        text: 'Schedule Outfit',
        color: Colors.green,
        icon: Icons.calendar_today,
        onTap: () {
        },
      ),
      // View my stats
      DashboardLink(
        text: 'View Stats',
        color: Colors.purple,
        icon: Icons.bar_chart,
        onTap: () {
        },
      ),
        ],
      ),
    ),  
    ],

  )
  ),


    );
  }
}
