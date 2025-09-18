import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class TranslationService extends Translations {
  static const String fallbackLocale = 'en';
  static const String defaultLocale = 'vi';

  static Map<String, Map<String, String>> translations = {};

  static Future<void> loadTranslations() async {
    try {
      // Load Vietnamese translations
      String viData = await rootBundle.loadString('lib/languages/vi.json');
      Map<String, dynamic> viMap = json.decode(viData);
      
      // Load English translations
      String enData = await rootBundle.loadString('lib/languages/en.json');
      Map<String, dynamic> enMap = json.decode(enData);

      // Convert to required format
      translations = {
        'vi_VN': viMap.map((key, value) => MapEntry(key, value.toString())),
        'en_US': enMap.map((key, value) => MapEntry(key, value.toString())),
      };
    } catch (e) {
       SnackBar(
      content: Text('Error loading translations: $e'),
      backgroundColor: Colors.red, 
      duration: Duration(seconds: 3),
    );
    }
  }

  @override
  Map<String, Map<String, String>> get keys => translations;
}

