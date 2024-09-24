import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/features/personalization/screens/settings/settings_screen.dart';
import 'package:store/features/shop/screens/home/home_screen.dart';
import 'package:store/features/shop/screens/store/store_screen.dart';
import 'package:store/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  int currentIndex = 0;

  final screens = const [
    HomeScreen(),
    StoreScreen(),
    WishlistScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: screens[currentIndex],

      // ** -- Bottom Navigation Menu

      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
        selectedIndex: currentIndex,
        height: 80,
        elevation: 0,
        backgroundColor: isDark ? AppColors.dark : Colors.white,
        indicatorColor: isDark
            ? Colors.white.withOpacity(0.15)
            : Colors.black.withOpacity(0.15),
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

    /* 
    bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        elevation: 0,
        backgroundColor: isDark ? Colors.black : Colors.white,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedIconTheme: IconThemeData(
          color: isDark ? Colors.blue : AppColors.primary,
        ),
        unselectedIconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
        selectedItemColor: isDark ? Colors.blue : Colors.purple,
        
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Iconsax.shop), label: 'Store'),
          BottomNavigationBarItem(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      ),
     */


    /* 
    
    *the main differences between the bottom navigation bar and the navigation bar are:


* Position: Bottom navigation bars are positioned at the bottom of the screen, 
while navigation bars are typically positioned at the top.
* Purpose: Bottom navigation bars are used for navigating between 
a small set of top-level screens, while navigation bars serve a broader purpose, 
providing navigation options, titles, and actions.
* Flexibility: Bottom navigation bars are more specialized for specific use cases,
 while navigation bars offer more flexibility and can be customized 
 to suit different navigation requirements.

     */