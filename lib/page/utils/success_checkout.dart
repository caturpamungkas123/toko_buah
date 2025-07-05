import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderAcceptedPage extends StatefulWidget {
  const OrderAcceptedPage({super.key});

  @override
  State<OrderAcceptedPage> createState() => _OrderAcceptedPageState();
}

class _OrderAcceptedPageState extends State<OrderAcceptedPage>
    with TickerProviderStateMixin {
  late AnimationController _checkController;

  @override
  void initState() {
    super.initState();
    _checkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      _checkController.forward();
    });
  }

  @override
  void dispose() {
    _checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  // Confetti (gunakan Lottie atau animasi kustom)
                  Lottie.asset(
                    'assets/lottie/Animation - 1751648589892.json', // Tambahkan animasi confetti di folder assets
                    width: 250,
                    repeat: false,
                  ),
                  // Circle with check icon
                  ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _checkController,
                      curve: Curves.easeOutBack,
                    ),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.15 * 255).toInt()),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              const Text(
                "Your Order has been\naccepted",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Your items has been placed and is on its way to being processed",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
              ),
              const Spacer(flex: 3),

              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, bottom: 50),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, "/"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Bact To Home",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
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
