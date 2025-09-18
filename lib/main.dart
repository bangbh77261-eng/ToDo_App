import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_sister/routers/app_pages.dart';
import 'languages/services/language_controller.dart';
import 'languages/services/translation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService.loadTranslations();
  Get.put(LanguageController(), permanent: true);
  await Supabase.initialize(
    url: 'https://eccnordaoxbyclzjzlsb.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVjY25vcmRhb3hieWNsemp6bHNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgxNjA2MjUsImV4cCI6MjA3MzczNjYyNX0.gIuzdxZq-1n9n2x7-6_34k76VPHEaMtBKJjirAm1P6E',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationService(),
      locale: const Locale('vi'),
      fallbackLocale: const Locale('en'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi'),
        Locale('en'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

