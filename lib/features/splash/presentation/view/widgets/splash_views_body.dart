import 'package:ai_daily_companion/core/utils/assets.dart';
import 'package:ai_daily_companion/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:flutter/material.dart';

class SplashViewsBody extends StatefulWidget {
  const SplashViewsBody({super.key});

  @override
  State<SplashViewsBody> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashViewsBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circle;
  late Animation<double> _glow;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    _circle = Tween(begin: 160.0, end: 200.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _glow = Tween(begin: 20.0, end: 35.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _scale = Tween(begin: 0.97, end: 1.03).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 2), () {
      _controller.stop();
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF152238),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // Soft outer circle
                Container(
                  width: _circle.value,
                  height: _circle.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF1E3A4C),
                  ),
                ),

                // Glow halo
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyan.withOpacity(0.6),
                        blurRadius: _glow.value,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),

                // Icon (clean, no cube)
                Transform.scale(
                  scale: _scale.value,
                  child: Image.asset(Assets.chatbot,
                    width: 110,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}