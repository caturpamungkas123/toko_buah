import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.imgPath,
    required this.title,
    required this.subTitle,
    required this.link,
    required this.price,
    this.width,
    this.height,
    this.imgHeight,
    this.imgWidth,
    required this.onTap,
  });

  final String imgPath;
  final String title;
  final String subTitle;
  final String link;
  final String price;
  double? width;
  double? height;
  double? imgWidth;
  double? imgHeight;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 160,
      height: height ?? 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 0.1)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar buah
          Center(
            child: Image.asset(
              imgPath, // ganti dengan path gambar kamu
              height: imgHeight ?? 80,
              width: imgWidth ?? 80,
              fit: BoxFit.fitHeight,
            ),
          ),
          const Spacer(),
          // Nama produk
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          // Detail pcs
          Text(subTitle, style: TextStyle(fontSize: 13, color: Colors.grey)),
          // Harga dan tombol tambah
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(6),
                child: GestureDetector(
                  onTap: () => onTap(),
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
