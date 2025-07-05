import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:toko_buah/utils/color_util.dart';
import 'package:toko_buah/utils/size_util.dart';

class MainPageAccount extends StatelessWidget {
  const MainPageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> menu = [
      {"id": "1", "title": "Order", "icon": Icon(Icons.shop_sharp, size: 25)},
      {
        "id": "2",
        "title": "My Details",
        "icon": Icon(Icons.perm_contact_calendar_rounded, size: 25),
      },
      {
        "id": "3",
        "title": "Delevery Addres",
        "icon": Icon(Icons.location_on_outlined, size: 25),
      },
      {
        "id": "4",
        "title": "Payment Method",
        "icon": Icon(Icons.payment, size: 25),
      },
      {
        "id": "5",
        "title": "Promo Card",
        "icon": Icon(Icons.discount, size: 25),
      },
      {
        "id": "6",
        "title": "Notification",
        "icon": Icon(Icons.notifications_on_outlined, size: 25),
      },
      {"id": "7", "title": "Help", "icon": Icon(Icons.help_outline, size: 25)},
      {"id": "8", "title": "About", "icon": Icon(Icons.info, size: 25)},
    ];

    return Scaffold(
      backgroundColor: mainCoolor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          // Tambahkan aksi logout di sini
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F4), // Latar abu muda
            borderRadius: BorderRadius.circular(19), // Sudut membulat
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout, color: Colors.green),
              SizedBox(width: 10),
              Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 25,
            left: paddingScafold,
            right: paddingScafold,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/img/pisang.png"),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              "Catur Pamungkas",
                              style: TextStyle(
                                color: colorTitlePage,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(Icons.edit, color: colorButton),
                            ),
                          ],
                        ),
                        Text(
                          "caturp101@gmail.com",
                          style: TextStyle(color: priceDetail, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
                //? LIST MENU
                ListView.builder(
                  itemCount: menu.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final item = menu[index];
                    log(index.toString());
                    return Container(
                      padding: EdgeInsetsGeometry.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          top:
                              index == 0
                                  ? BorderSide(color: priceDetail, width: .5)
                                  : BorderSide.none,
                          bottom: BorderSide(color: priceDetail, width: .5),
                        ),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: item["icon"],
                        title: Text(
                          item["title"],
                          style: TextStyle(
                            fontSize: 18,
                            color: colorTitlePage,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
