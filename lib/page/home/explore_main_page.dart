import 'package:flutter/material.dart';
import 'package:toko_buah/routes/navigator_service.dart';
import 'package:toko_buah/utils/color_util.dart';
import 'package:toko_buah/utils/size_util.dart';
import 'package:toko_buah/utils/widget_util.dart';

class ExploreMainPage extends StatelessWidget {
  const ExploreMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        "title": "Frash Fruits & Vegetable",
        "thumbnail": "explore-img.png",
        "bg-color": 0xFFF5FBF2,
        "border-color": 0xff53B175,
      },
      {
        "title": "Drink",
        "thumbnail": "explore-img.png",
        "bg-color": 0xFFF5FBF2,
        "border-color": 0xff53B175,
      },
      {
        "title": "Junk Food",
        "thumbnail": "explore-img.png",
        "bg-color": 0xFFF5FBF2,
        "border-color": 0xff53B175,
      },
      {
        "title": "Frash Fruits & Vegetable",
        "thumbnail": "explore-img.png",
        "bg-color": 0xFFF5FBF2,
        "border-color": 0xff53B175,
      },
      {
        "title": "Frash Fruits & Vegetable",
        "thumbnail": "explore-img.png",
        "bg-color": 0xFFF5FBF2,
        "border-color": 0xff53B175,
      },
      {
        "title": "Frash Fruits & Vegetable",
        "thumbnail": "explore-img.png",
        "bg-color": 0xFFF5FBF2,
        "border-color": 0xff53B175,
      },
      {
        "title": "Frash Fruits & Vegetable",
        "thumbnail": "explore-img.png",
        "bg-color": 0xFFF5FBF2,
        "border-color": 0xff53B175,
      },
    ];

    return Scaffold(
      backgroundColor: mainCoolor,
      appBar: AppBar(
        backgroundColor: mainCoolor, // <- tambahkan ini
        elevation:
            0, // opsional: untuk menghilangkan bayangan agar lebih menyatu
        centerTitle: true,
        forceMaterialTransparency:
            true, // agar ketika di scroll, app bar tidak berubah warna
        title: titlePage("Find Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: paddingScafold,
            right: paddingScafold,
          ),
          child: Column(
            children: [
              Search(),
              SizedBox(height: 15),
              GridView.count(
                crossAxisCount: 2, // 2 item per baris
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children:
                    data.map((item) {
                      return GestureDetector(
                        onTap:
                            () => rootNavigatorKey.currentState!.pushNamed(
                              '/explore-detail',
                              arguments: {'title': item["title"]},
                            ),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 13,
                            right: 13,
                            top: 25,
                            bottom: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Color(item["bg-color"]),
                            border: Border.all(
                              color: Color(item["border-color"]),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 72.69,
                                width: 102.13,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/img/${item["thumbnail"]}",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                item["title"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff181725),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
