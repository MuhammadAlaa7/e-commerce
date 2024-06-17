import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/features/personalization/screens/settings/settings.dart';
import 'package:store/features/shop/screens/home/home_screen.dart';
import 'package:store/features/shop/screens/store/store_screen.dart';
import 'package:store/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper_functions.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentIndex = 0;

  final screens = const [
    HomeScreen(),
    StoreScreen(),
    WishlistScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: screens[currentIndex],

     
      // ** -- Bottom Navigation Menu

      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
        selectedIndex: currentIndex,
        height: 80,
        elevation: 0,
        backgroundColor: isDark ? CColors.dark : Colors.white,
        indicatorColor: isDark
            ? Colors.white.withOpacity(0.1)
            : Colors.black.withOpacity(0.1),
        onDestinationSelected: (index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
      ),
    );
  }

}

// * -- Another way to implement bottom navigation menu

    // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (value) {
      //     setState(() {
      //       currentIndex = value;
      //     });
      //   },
      //   elevation: 0,
      //   backgroundColor: isDark ? Colors.black : Colors.white,
      //   selectedItemColor: isDark ? Colors.blue : Colors.purple,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Iconsax.shop), label: 'Store'),
      //     BottomNavigationBarItem(icon: Icon(Iconsax.heart), label: 'Wishlist'),
      //     BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Profile'),
      //   ],
      // ),