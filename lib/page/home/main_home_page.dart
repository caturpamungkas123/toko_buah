import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toko_buah/page/utils/product_card_util.dart';
import 'package:toko_buah/page/utils/slide_home_page.dart';
import 'package:toko_buah/routes/navigator_service.dart';
import 'package:toko_buah/utils/color_util.dart';
import 'package:toko_buah/utils/size_util.dart';
import 'package:toko_buah/utils/widget_util.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

List categori = ["Exclusive Offer", "Best Selling", "Favorit"];

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainCoolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            left: paddingScafold,
            right: paddingScafold,
          ),
          child: Column(
            children: [
              Logo(),
              Location(),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Search(),
              ),
              SlideHomePage(),
              ListView.builder(
                shrinkWrap: true, // biar tinggi menyesuaikan isi
                physics: NeverScrollableScrollPhysics(),
                itemCount: categori.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ListCategori(title: categori[index], link: ""),
                      ),
                      SizedBox(
                        height: 200, // ← atur tinggi sesuai kebutuhan
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                // jiak index adalah yang pertama maka kasih padding hanya rightnya
                                left: index == 0 ? 0 : 10,
                                // sesuaikan dengan ittemcount
                                // jika index akhir sama dengan max maka kasih padding di lefft nya,
                                right: index == 5 ? 10 : 0,
                              ),
                              child: ProductCard(
                                onTap:
                                    () => rootNavigatorKey.currentState!
                                        .pushNamed(
                                          '/product-detail',
                                          arguments: {
                                            'imgPath': 'assets/img/pisang.png',
                                          },
                                        ),
                                imgPath: "assets/img/pisang.png",
                                subTitle: "7pcs, Priceg",
                                title: "Organic Bananas",
                                link: "detail",
                                price: "\$4.99",
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListCategori extends StatelessWidget {
  const ListCategori({super.key, required this.title, required this.link});

  final String title;
  final String link;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xff181725),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/detail"),
          child: Text(
            "See all",
            style: TextStyle(
              color: Color(0xff53B175),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: SvgPicture.asset("assets/svg/logo_warna.svg"),
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.location_on, color: Color(0xff4C4F4D)),
        Text(
          "Kebumen",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xff4C4F4D),
          ),
        ),
      ],
    );
  }
}
