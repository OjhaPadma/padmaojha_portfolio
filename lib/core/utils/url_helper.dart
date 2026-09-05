import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/portfolio_content.dart';

abstract final class UrlHelper {
  static Future<void> open(String url, {bool newTab = true}) async {
    final uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: newTab
          ? LaunchMode.externalApplication
          : LaunchMode.platformDefault,
      webOnlyWindowName: newTab ? '_blank' : '_self',
    );
  }

  static Future<void> openResume() async {
    if (kIsWeb) {
      if (!kDebugMode) {
        await launchUrl(
          Uri.base.resolve(PortfolioContent.resumeWebPath),
          webOnlyWindowName: '_blank',
        );
        return;
      }
      final data = await rootBundle.load(PortfolioContent.resumeAssetPath);
      final b64 = base64Encode(data.buffer.asUint8List());
      await launchUrl(
        Uri.parse('data:application/pdf;base64,$b64'),
        webOnlyWindowName: '_blank',
      );
      return;
    }
    await open(PortfolioContent.githubUrl);
  }
}
