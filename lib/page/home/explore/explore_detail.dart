import 'package:flutter/material.dart';
import 'package:toko_buah/page/utils/product_card_util.dart';
import 'package:toko_buah/routes/navigator_service.dart';
import 'package:toko_buah/utils/color_util.dart';
import 'package:toko_buah/utils/size_util.dart';
import 'package:toko_buah/utils/widget_util.dart';

class ExploreDetail extends StatefulWidget {
  const ExploreDetail({super.key, required this.title});

  final String title;

  @override
  State<ExploreDetail> createState() => _ExploreDetailState();
}

class _ExploreDetailState extends State<ExploreDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainCoolor,
      appBar: AppBar(
        backgroundColor: mainCoolor,
        elevation: 0,
        centerTitle: true,
        title: titlePage(widget.title),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: paddingScafold,
            right: paddingScafold,
          ),
          child: Column(
            children: [
              Search(),
              SizedBox(height: 15),
              ProductCard(
                onTap:
                    () => rootNavigatorKey.currentState!.pushNamed(
                      '/product-detail',
                      arguments: {'imgPath': 'assets/img/pisang.png'},
                    ),
                imgHeight: 120,
                imgWidth: 120,
                height: 235,
                imgPath: "assets/img/explore-img.png",
                title: "Coca-Cola",
                subTitle: "325ml, Price",
                link: "",
                price: "200",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
