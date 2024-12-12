import 'package:flutter/material.dart';
import 'package:mobile_tokoku/src/utils/TColors.dart';

class HeaderBar extends StatefulWidget {
  const HeaderBar({super.key});

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: (MediaQuery.of(context).size.width - 110),
            child: TextField(
              controller: searchTextController,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black45, fontSize: 13),
              // Set text color
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 12,
                ),
                isDense: true,
                fillColor: Colors.white,
                filled: true,
                hintText: "Cari",
                hintStyle: const TextStyle(color: Colors.black45, fontSize: 13),
                labelStyle: const TextStyle(color: Colors.black45),
                // Set accent color
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black45,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: TColors.white, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: TColors.white, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: TColors.white, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 27,
                    color: Colors.white,
                  ),
                  Spacer(),
                  Icon(
                    Icons.chat_bubble,
                    size: 27,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
