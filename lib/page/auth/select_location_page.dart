import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({super.key});

  @override
  State<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/img/bg_auth.jpg"),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                  width: 224,
                  child: SvgPicture.asset("assets/svg/map.svg"),
                ),
                SizedBox(height: 30),
                Text(
                  "Select Your Location",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 26,
                  ),
                ),
                Text(
                  "Swithch on your location to stay in tune with what's happening in your area",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xff7C7C7C)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
