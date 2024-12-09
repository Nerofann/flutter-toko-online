import 'package:flutter/material.dart';
import 'package:mobile_tokoku/src/utils/TColors.dart';

class DashboardSmallMenu extends StatefulWidget {
  const DashboardSmallMenu({super.key});

  @override
  State<DashboardSmallMenu> createState() => _DashboardSmallMenuState();
}

class _DashboardSmallMenuState extends State<DashboardSmallMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Container(
        padding: const EdgeInsets.only(top: 8),
        decoration: const BoxDecoration(
          color: TColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.shield, color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Data',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
