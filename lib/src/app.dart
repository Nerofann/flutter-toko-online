import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_tokoku/src/dashboard/dashboard_view.dart';
import 'package:mobile_tokoku/src/settings/settings_service.dart';
import 'package:mobile_tokoku/src/utils/TColors.dart';
import 'package:mobile_tokoku/src/utils/common_textfield.dart';
import 'package:http/http.dart' as http;

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
    final TextEditingController searchTextController = TextEditingController();

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
              if (index == 1) {
                // fetchProducts();
              }
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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            key: UniqueKey(),
            slivers: [
              SliverAppBar(
                backgroundColor: TColors.primary,
                pinned: true,
                floating: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Wrap(
                      children: [
                        CommonTextfield(
                          controller: searchTextController,
                          keyboardType: TextInputType.text,
                          prefixIconData: Icons.search,
                          hintText: "Search Here",
                          onChanged: (val) {
                            return val;
                          },
                        ),
                        const Icon(Icons.abc)
                      ],
                    ),
                  ),
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

Future<List<Widget>> fetchProducts() async {
  var url = Uri.https("dummyjson.com", "products");
  var response = await http.get(url);
  var object = jsonDecode(response.body);
  List<Widget> products = [];
  object.products.forEach((val) async {
    products.add(
      Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: Image.network(
              val.images,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(color: TColors.white),
            child: Column(
              children: [
                const Text(
                  "HARDDISK INTERNAL 1 TB HDD CCTV TYPE SATA",
                  style: TextStyle(fontSize: 11),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/cod-blue.png", width: 20)
                  ],
                ),
                const SizedBox(height: 4),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Rp",
                      style: TextStyle(
                        fontSize: 11,
                        color: TColors.primary,
                      ),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "299.000",
                      style: TextStyle(
                        fontSize: 11,
                        color: TColors.primary,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  });

  return products;
}
