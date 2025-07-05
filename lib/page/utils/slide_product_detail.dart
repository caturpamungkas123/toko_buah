import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideProductDetail extends StatefulWidget {
  const SlideProductDetail({super.key});

  @override
  State<SlideProductDetail> createState() => _SlideProductDetailState();
}

class _SlideProductDetailState extends State<SlideProductDetail> {
  final List<String> bannerImages = [
    'assets/img/pisang.png',
    'assets/img/pisang.png',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.44, // <-- INI PENTING: beri tinggi tetap
      decoration: BoxDecoration(
        color: Color(0xffF2F3F2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SizedBox(
        height: 199,
        child: Stack(
          children: [
            // Carousel isi penuh area
            Positioned.fill(
              child: CarouselSlider.builder(
                itemCount: bannerImages.length,
                itemBuilder: (context, index, realIndex) {
                  return _buildBanner(bannerImages[index]);
                },
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),

            // Indikator di bagian bawah
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(bannerImages.length, (index) {
                  return _buildIndicator(index == _currentIndex);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(String imagePath) {
    return Container(
      width: 329.4,
      height: 199.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 16 : 5,
      height: 5,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
