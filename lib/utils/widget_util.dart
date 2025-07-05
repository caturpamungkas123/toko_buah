import 'package:flutter/material.dart';
import 'package:toko_buah/utils/color_util.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.title, required this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: MediaQuery.of(context).size.width * .83,
        height: 67,
        decoration: BoxDecoration(
          color: splashBg,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

Text titlePage(String title) {
  return Text(
    title,
    style: TextStyle(
      color: colorTitlePage,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          filled: true,
          fillColor: Color(0xffF2F3F2),
          prefixIcon: Icon(Icons.search),
          hintText: "Search Store",
          floatingLabelStyle: TextStyle(color: Colors.green),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.green), // Saat fokus
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
