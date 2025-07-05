import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toko_buah/page/utils/slide_product_detail.dart';
import 'package:toko_buah/utils/color_util.dart';
import 'package:toko_buah/utils/size_util.dart';
import 'package:toko_buah/utils/widget_util.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.imgPath});

  final String imgPath;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;
  final double onePrice = 4.99;
  double price = 4.99;
  bool _favorite = false;

  void _mountPrice() {
    setState(() {
      price = quantity * onePrice;
    });
  }

  void _increment() {
    setState(() {
      quantity++;
    });
    _mountPrice();
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
      _mountPrice();
    }
  }

  void addFavorite() {
    setState(() {
      _favorite = !_favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainCoolor,
      extendBodyBehindAppBar:
          true, // <- penting untuk gambar bisa di belakang AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // AppBar transparan
        elevation: 0, // hilangkan bayangan AppBar
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ), // sesuaikan warna
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SlideProductDetail(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingScafold),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Natural Red Apple",
                        style: TextStyle(
                          color: Color(0xff181725),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => addFavorite(),
                        icon: FaIcon(
                          _favorite
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: _favorite ? Colors.red : null,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "1Kg, Price",
                      style: TextStyle(color: priceDetail),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Quantity Control
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => _decrement(),
                            child: Icon(Icons.remove, color: Colors.grey),
                          ),
                          // Quantity Box
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                              color: Colors.white,
                            ),
                            child: Text(
                              quantity.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _increment(),
                            child: Icon(Icons.add, color: Colors.green),
                          ),
                        ],
                      ),

                      /// Price
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C1C1E), // warna hitam solid
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  /* Detail */
                  ExpansionTitle(
                    title: "Product Detail",
                    child: Text(
                      'Apples are nutritious. Apples may be good for weight loss. '
                      'Apples may be good for your heart. As part of a healthful and varied diet.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                    ),
                  ),
                  /** Nutritions */
                  ExpansionTitle(
                    title: "Nutritions",
                    rightWidget: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffEBEBEB),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        "100gr",
                        style: TextStyle(fontSize: 9, color: Color(0xff7C7C7C)),
                      ),
                    ),
                  ),
                  /** Review */
                  ExpansionTitle(
                    title: "Review",
                    rightWidget: Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color:
                              index + 1 <= 4
                                  ? Color(0xffF3603F)
                                  : Color(0xffEBEBEB),
                        );
                      }),
                    ),
                  ),
                  Button(
                    title: "Add To Chart",
                    onTap: () {
                      {}
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpansionTitle extends StatelessWidget {
  const ExpansionTitle({
    super.key,
    required this.title,
    this.rightWidget,
    this.child,
  });
  final String title;
  final Widget? rightWidget;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: false,
      visualDensity: VisualDensity.compact,
      tilePadding: EdgeInsets.zero,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          rightWidget ?? SizedBox(),
        ],
      ),
      children: [child ?? SizedBox()],
    );
  }
}
