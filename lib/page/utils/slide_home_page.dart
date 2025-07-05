import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideHomePage extends StatefulWidget {
  const SlideHomePage({super.key});

  @override
  State<SlideHomePage> createState() => _SlideHomePageState();
}

class _SlideHomePageState extends State<SlideHomePage> {
  final List<String> bannerImages = [
    'assets/img/onboarding.jpg',
    'assets/img/onboarding.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114.99, // <-- INI PENTING: beri tinggi tetap
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
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                height: 114.99, // <-- penting juga beri tinggi di sini
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
            bottom: 10,
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
    );
  }

  Widget _buildBanner(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
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
