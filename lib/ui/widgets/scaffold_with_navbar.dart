import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A simple data model for navigation destinations.
class NavigationDestination {
  final IconData icon;
  final String label;
  final String route; // Add route info for navigation

  NavigationDestination({
    required this.icon,
    required this.label,
    required this.route,
  });
}

/// A scaffold that adapts navigation UI based on screen size.
/// Uses a NavigationRail for wider screens and a curved bottom nav for smaller screens.
class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  ScaffoldWithNavBar({super.key, required this.navigationShell});

  // Shared destinations array for both sidebar and bottom bar.
  final List<NavigationDestination> destinations = [
    NavigationDestination(icon: Icons.dashboard, label: 'Home', route: "/"),
    NavigationDestination(icon: Icons.checkroom, label: 'Wardrobe', route: "/wardrobe"),
    NavigationDestination(icon: Icons.photo_album, label: 'Lookbook', route: "/lookbook"),
    NavigationDestination(icon: Icons.settings, label: 'Settings', route: "/settings"),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double breakpoint = 600;

    if (screenWidth >= breakpoint) {
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
            Expanded(child: navigationShell),
          ],
        ),
      );
    } else {
      return Scaffold(
        extendBody: true,
        body: Column(
          children: [
            Expanded(child: 
            navigationShell
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBarCurvedFb1(destinations: destinations),
      );
    }
  }
}

/// Custom curved bottom navigation bar with a centered floating action button.
class BottomNavBarCurvedFb1 extends StatefulWidget {
  final List<NavigationDestination> destinations;

  const BottomNavBarCurvedFb1({Key? key, required this.destinations}) : super(key: key);

  @override
  _BottomNavBarCurvedFb1State createState() => _BottomNavBarCurvedFb1State();
}

class _BottomNavBarCurvedFb1State extends State<BottomNavBarCurvedFb1> {
  int _selectedIndex = 0; // Tracks the selected tab

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;
    final primaryColor = Colors.blue;
    final secondaryColor = Colors.black54;
    final backgroundColor = Colors.white;

    // Split the destinations list for left and right of FAB.
    int mid = (widget.destinations.length / 2).floor();
    List<NavigationDestination> leftItems = widget.destinations.sublist(0, mid);
    List<NavigationDestination> rightItems = widget.destinations.sublist(mid);

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height + 6),
            painter: BottomNavCurvePainter(backgroundColor: backgroundColor),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              child: Icon(Icons.add),
              elevation: 0.1,
              onPressed: () {
                context.push("/camera");
              },
            ),
          ),
          Container(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Left side icons
                ...List.generate(leftItems.length, (index) {
                  return NavBarIcon(
                    text: leftItems[index].label,
                    icon: leftItems[index].icon,
                    selected: _selectedIndex == index,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      context.replace(leftItems[index].route);
                    },
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor,
                  );
                }),
                SizedBox(width: 56), // Gap for the FAB
                // Right side icons
                ...List.generate(rightItems.length, (index) {
                  // Actual index is mid + index.
                  int actualIndex = mid + index;
                  return NavBarIcon(
                    text: rightItems[index].label,
                    icon: rightItems[index].icon,
                    selected: _selectedIndex == actualIndex,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = actualIndex;
                      });
                      context.go(rightItems[index].route);
                    },
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor,
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painter that draws the curved shape for the bottom navigation bar.
class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter({this.backgroundColor = Colors.white, this.insetRadius = 38});

  final Color backgroundColor;
  final double insetRadius;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * 0.05;

    path.quadraticBezierTo(
      size.width * 0.20,
      0,
      insetCurveBeginnningX - transitionToInsetCurveWidth,
      0,
    );
    path.quadraticBezierTo(
      insetCurveBeginnningX,
      0,
      insetCurveBeginnningX,
      insetRadius / 2,
    );
    path.arcToPoint(
      Offset(insetCurveEndX, insetRadius / 2),
      radius: Radius.circular(10.0),
      clockwise: false,
    );
    path.quadraticBezierTo(
      insetCurveEndX,
      0,
      insetCurveEndX + transitionToInsetCurveWidth,
      0,
    );
    path.quadraticBezierTo(
      size.width * 0.80,
      0,
      size.width,
      12,
    );
    path.lineTo(size.width, size.height + 56);
    path.lineTo(0, size.height + 56);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// A widget that represents an individual icon in the navigation bar.
class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    Key? key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
    this.selectedColor = const Color(0xffFF8527),
    this.defaultColor = Colors.black54,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}