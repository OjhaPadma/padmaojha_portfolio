import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'data/portfolio_content.dart';
import 'pages/home_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: PortfolioContent.siteTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const HomePage(),
    );
  }
}
