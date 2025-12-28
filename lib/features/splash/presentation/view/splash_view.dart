
import 'package:ai_daily_companion/features/splash/presentation/view/widgets/splash_views_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewsBody());
  }
}
