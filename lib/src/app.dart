import 'package:flutter/material.dart';
import 'package:mobile_tokoku/src/dashboard/dashboard_view.dart';
import 'package:mobile_tokoku/src/settings/settings_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SettingsService settingsService = SettingsService();
  int currentTabIndex = 0;
  final listTabPages = <Widget>[
    const Dashboard(),
    const Center(
      child: Icon(
        Icons.cloud,
        size: 64.0,
        color: Colors.redAccent,
      ),
    ),
    const Center(
      child: Icon(
        Icons.cloud,
        size: 64.0,
        color: Colors.greenAccent,
      ),
    ),
    const Center(
      child: Icon(
        Icons.cloud,
        size: 64.0,
        color: Colors.greenAccent,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: const Icon(Icons.home_outlined),
              activeIcon: Icon(
                Icons.home,
                color: settingsService.primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: "Product",
              icon: const Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(
                Icons.shopping_cart,
                color: settingsService.primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: const Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(
                Icons.shopping_bag,
                color: settingsService.primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: const Icon(Icons.person),
              activeIcon: Icon(
                Icons.shopping_bag,
                color: settingsService.primaryColor,
              ),
            )
          ],
        ),
        body: Container(
          child: listTabPages[currentTabIndex],
        ),
      ),
    );
  }
}
