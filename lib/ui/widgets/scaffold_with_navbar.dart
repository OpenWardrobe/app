import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationDestination {
  final IconData icon;
  final String label;

  NavigationDestination({required this.icon, required this.label});
}

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  ScaffoldWithNavBar({Key? key, required this.navigationShell})
      : super(key: key);

  final List<NavigationDestination> destinations = [
    NavigationDestination(icon: Icons.people
    , label: 'Community'),
    NavigationDestination(icon: Icons.checkroom, label: 'Wardrobe'),
    NavigationDestination(icon: Icons.settings, label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double breakpoint = 600;

    if (screenWidth >= breakpoint) {
      // For larger screens, display a sidebar
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
              labelType: NavigationRailLabelType.selected,
              destinations: destinations
                  .map(
                    (destination) => NavigationRailDestination(
                      icon: Icon(destination.icon),
                      label: Text(destination.label),
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: navigationShell,
            ),
          ],
        ),
      );
    } else {
      // For smaller screens, display a bottom navigation bar
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          items: destinations
              .map(
                (destination) => BottomNavigationBarItem(
                  icon: Icon(destination.icon),
                  label: destination.label,
                ),
              )
              .toList(),
        ),
      );
    }
  }
}