// A link stateless widget that takes a text and a function as parameters
// Return a rectangle with a icon and text, with a onTap function
// The onTap function is used to navigate to a different page


import 'package:flutter/material.dart';

class DashboardLink extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const DashboardLink({super.key, required this.text, required this.icon, required this.onTap, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // It should be a 25x25 square
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}