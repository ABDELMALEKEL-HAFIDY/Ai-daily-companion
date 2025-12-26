import 'package:ai_daily_companion/core/helper/on_generate_route.dart';
import 'package:ai_daily_companion/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AiDailyCompanion());
}

class AiDailyCompanion extends StatelessWidget {
  const AiDailyCompanion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute, 
      initialRoute: SplashView.routeName,
    );
  }
}
