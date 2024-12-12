import 'package:flutter/material.dart';
import 'package:mobile_tokoku/src/dashboard/small_menu.dart';
import 'package:mobile_tokoku/src/dashboard/models/m_product.dart';
import 'package:mobile_tokoku/src/utils/TColors.dart';
import 'dashboard_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController searchTextController = TextEditingController();
  late Future<List<Products>> products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: DashboardSmallMenu(),
        ),
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder(
            future: getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                ); // Loading indicator
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                ); // Error message
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No data available'),
                ); // Empty state
              }

              // print(products);
              // print(snapshot.data!.length);
              // return Text("test");
              final data = snapshot.data;
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.start,
                children: List.generate(
                  data?.length ?? 0,
                  (i) {
                    return SizedBox(
                      width: (MediaQuery.of(context).size.width - 30) / 2,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                              child: Image.network(
                                data![i].productImage!,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              data[i].productTitle ?? "-",
                              style: const TextStyle(fontSize: 11),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/cod-blue.png",
                                    width: 20)
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
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
