import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile_tokoku/src/utils/TColors.dart';
import 'package:mobile_tokoku/src/utils/common_textfield.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imgSliders = imgList
        .map(
          (item) => SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                item,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
        .toList();

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: TColors.primary),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CommonTextfield(
                  controller: searchTextController,
                  keyboardType: TextInputType.text,
                  prefixIconData: Icons.search,
                  hintText: "Search Here",
                  onChanged: (val) {
                    return val;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 5,
                  children: List.generate(8, (index) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: TColors.white,
                            border: Border.all(color: TColors.white),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Icon(
                              Icons.verified_user,
                              size: 20,
                            ),
                          ),
                        ),
                        const Text(
                          "Data",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )
                      ],
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(top: 40.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: TColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50.0),
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: List.generate(imgList.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2.0),
                        child: Image.network(
                          imgList[index],
                          height: 10.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
