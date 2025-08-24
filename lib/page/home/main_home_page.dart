import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toko_buah/bloc/product/product_bloc.dart';
import 'package:toko_buah/model/product/category.product.dart';
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
  void initState() {
    context.read<ProductBloc>().add(OnFetchCatgortProduct());
    super.initState();
  }

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
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is ProductFail) {
                    return Text(state.message);
                  } else if (state is ProductLoad) {
                    // Pastikan 'data' tidak null. Jika null, berikan list kosong
                    final List<Datum> data = state.categori.data ?? [];

                    // Jika data kosong, tampilkan pesan "empty"
                    if (data.isEmpty) {
                      return const Center(child: Text("empty"));
                    }

                    return ListView.builder(
                      shrinkWrap: true, // biar tinggi menyesuaikan isi
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final Datum item = data[index];
                        final List<Product> products = item.product ?? [];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: ListCategori(
                                title: item.name ?? "",
                                link: "",
                              ),
                            ),
                            SizedBox(
                              height: 200, // ← atur tinggi sesuai kebutuhan
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  final Product product = products[index];

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
                                                  'imgPath':
                                                      'assets/img/pisang.png',
                                                },
                                              ),
                                      imgPath: "assets/img/pisang.png",
                                      subTitle: product.heavy ?? "",
                                      title: product.name ?? "",
                                      link: "detail",
                                      price: "Rp.${product.price ?? ""}",
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
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
