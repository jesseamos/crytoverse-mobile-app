import 'package:coinranking/core/config/colors_constant.dart';
import 'package:coinranking/core/icons/dashboard_icons.dart';
import 'package:coinranking/core/presentation/svg_icon.dart';
import 'package:coinranking/features/dashboard/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainDashboardScreen extends StatefulWidget {
  static const routeName = '/main-dashboard';
  const MainDashboardScreen({super.key});

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const PlaceholderScreen(title: 'CrytoCurrency'),
    const PlaceholderScreen(title: 'Exchanges'),
    const PlaceholderScreen(title: 'News'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBarTheme = Theme.of(context).bottomNavigationBarTheme;

    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      // Custom Bottom Navigation Bar Container
      bottomNavigationBar: Container(
        height: 98,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(23.0),
          ), // Rounded top corners
          border: const Border(
            top: BorderSide(
              color: ColorsConstant.stroke,
              width: 2, // Set border thickness
            ),
          ),
        ),

        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgIcon(
                  svgPath: mainDashboardIcon,
                  size: 22,
                  color: ColorsConstant.greyText,
                ),
                activeIcon: SvgIcon(svgPath: mainDashboardIcon, size: 22),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(svgPath: dmAutomationNavIcon, size: 22),
                activeIcon: SvgIcon(
                  svgPath: dmAutomationNavIcon,
                  size: 22,
                  color: ColorsConstant.blue,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(svgPath: penIcon, size: 22),
                activeIcon: SvgIcon(
                  svgPath: penIcon,
                  size: 22,
                  color: ColorsConstant.blue,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(svgPath: pieIcon, size: 22),
                activeIcon: SvgIcon(
                  svgPath: pieIcon,
                  size: 22,
                  color: ColorsConstant.blue,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(svgPath: bookIcon, size: 22),
                activeIcon: SvgIcon(
                  svgPath: bookIcon,
                  size: 22,
                  color: ColorsConstant.blue,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(svgPath: flashIcon, size: 22),
                activeIcon: SvgIcon(
                  svgPath: flashIcon,
                  size: 22,
                  color: ColorsConstant.blue,
                ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: ColorsConstant
                .darkgrey, // Make BNB transparent to show container's color/decoration
            elevation:
                0, // Remove default BNB elevation as container handles shadow
            // Ensure other properties are taken from the theme if not specified here
            selectedItemColor: bottomNavBarTheme.selectedItemColor,
            unselectedItemColor: bottomNavBarTheme.unselectedItemColor,
            type: bottomNavBarTheme.type,
            selectedIconTheme: bottomNavBarTheme.selectedIconTheme,
            unselectedIconTheme: bottomNavBarTheme.unselectedIconTheme,
            showSelectedLabels: bottomNavBarTheme.showSelectedLabels,
            showUnselectedLabels: bottomNavBarTheme.showUnselectedLabels,
          ),
        ),
      ),
    );
  }
}

// Simple Placeholder widget for screen content
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.space_dashboard_outlined,
            size: 80,
            color: Colors.grey[700],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'Content for this section will appear here. This is a placeholder.',
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
