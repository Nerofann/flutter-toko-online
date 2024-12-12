import 'package:flutter/material.dart';
import 'package:mobile_tokoku/src/dashboard/dashboard_view.dart';
import 'package:mobile_tokoku/src/profiles/profiles.dart';
import 'package:mobile_tokoku/src/settings/settings_service.dart';
import 'package:mobile_tokoku/src/utils/TColors.dart';
import 'header.dart';

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
    const Profiles(),
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
              label: "Beranda",
              icon: const Icon(Icons.home_outlined),
              activeIcon: Icon(
                Icons.home,
                color: settingsService.primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: "Produk",
              icon: const Icon(Icons.local_mall_outlined),
              activeIcon: Icon(
                Icons.shopping_cart,
                color: settingsService.primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: "Notifikasi",
              icon: const Icon(Icons.notifications_none),
              activeIcon: Icon(
                Icons.shopping_bag,
                color: settingsService.primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              label: "Saya",
              icon: const Icon(Icons.person),
              activeIcon: Icon(
                Icons.person,
                color: settingsService.primaryColor,
              ),
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            key: UniqueKey(),
            slivers: [
              const SliverAppBar(
                backgroundColor: TColors.primary,
                pinned: true,
                floating: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: HeaderBar(),
                ),
              ),
              SliverToBoxAdapter(
                child: listTabPages[currentTabIndex],
              )
            ],
          ),
        ),
      ),
    );
  }
}