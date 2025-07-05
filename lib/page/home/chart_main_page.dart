import 'package:flutter/material.dart';
import 'package:toko_buah/page/utils/faild_checkout.dart';
import 'package:toko_buah/page/utils/success_checkout.dart';
import 'package:toko_buah/utils/color_util.dart';
import 'package:toko_buah/utils/size_util.dart';
import 'package:toko_buah/utils/widget_util.dart';

class ChartMainPage extends StatefulWidget {
  const ChartMainPage({super.key});

  @override
  ChartMainPageState createState() => ChartMainPageState();
}

class ChartMainPageState extends State<ChartMainPage> {
  int quantity = 1;
  bool statusCheckOut = true;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  // remove widget yang berada pada list cart
  void removeListCart() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainCoolor,
      appBar: AppBar(
        forceMaterialTransparency:
            true, // agar ketika di scroll, app bar tidak berubah warna
        backgroundColor: mainCoolor,
        elevation: 0,
        centerTitle: true,
        title: titlePage("My Cart"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingScafold),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return CardCart(
                    thumbnail: "assets/img/explore-img.png",
                    product: "Minuman",
                    price: "\$20",
                    description: "1Kg, Price",
                    incrementQuantity: () => _incrementQuantity(),
                    decrementQuantity: () => _decrementQuantity(),
                    removeListCard: () => removeListCart(),
                  );
                },
              ),
              SizedBox(height: 80), // Spacer untuk menghindari overlap tombol
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff53B175),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            showCheckoutModal(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Go to Checkout",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xff489E67),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "\$12.96",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showCheckoutModal(BuildContext context) {
  bool? statusCheckOut = true;

  void placeOrder(BuildContext context) {
    Navigator.pop(context);
    if (statusCheckOut) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderAcceptedPage()),
      );
    } else {
      showOrderFailedDialog(context);
    }
  }

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Checkout",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Payment"), Text("paymenthod")],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Total Cost"), Text("\$ 200")],
                    ),
                    trailing: SizedBox(),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 20),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "By placing and order you agree to our ",
                            style: TextStyle(color: priceDetail),
                          ),
                          TextSpan(
                            text: "Terms ",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: "And ",
                            style: TextStyle(color: priceDetail),
                          ),
                          TextSpan(
                            text: "Conditionals ",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => placeOrder(context),

                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Place Order",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

// ignore: must_be_immutable
class CardCart extends StatefulWidget {
  CardCart({
    super.key,
    required this.thumbnail,
    required this.product,
    required this.price,
    required this.description,
    required this.incrementQuantity,
    required this.decrementQuantity,
    required this.removeListCard,
  });

  String thumbnail;
  String product;
  String price;
  String description;
  VoidCallback incrementQuantity;
  VoidCallback decrementQuantity;
  VoidCallback removeListCard;

  @override
  State<CardCart> createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          // Product Image
          SizedBox(
            width: 100,
            height: 80,
            child: Image.asset(
              widget.thumbnail, // Ganti dengan path gambar Anda
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(width: 16),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    // Close button
                    GestureDetector(
                      onTap: () => widget.removeListCard(),
                      child: Icon(Icons.close, color: Colors.grey, size: 20),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: 16),
                // Quantity selector and price row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Quantity selector
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => widget.decrementQuantity(),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Colors.grey[600],
                              size: 16,
                            ),
                          ),
                        ),

                        Container(
                          width: 40,
                          alignment: Alignment.center,
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () => widget.incrementQuantity(),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Price
                    Text(
                      widget.price,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
