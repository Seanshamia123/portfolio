import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/shared/app_locale_controller.dart';
import 'package:portfolio/shared/app_theme_controller.dart';
import 'package:portfolio/style/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(applocaleControllerProvider);
    final theme = ref.watch(appThemeControllerProvider);

    return MaterialApp.router(
      routerConfig: GoRouter(
        routes: [
          // Add your routes here
        ],
      ),
      darkTheme: AppTheme(fontFamily: _fontFamily(locale.value)).dark,
      theme: AppTheme(fontFamily: _fontFamily(locale.value)).light,
      themeMode: theme.value,
      supportedLocales: const [Locale('en'), Locale('es'), Locale('de')],
      locale: Locale(locale.value ?? 'en'),
    );
  }

  String _fontFamily(String? locale) {
    switch (locale) {
      case 'en':
        return GoogleFonts.roboto().fontFamily ?? 'Roboto';
      case 'es':
        return GoogleFonts.roboto().fontFamily ?? 'Roboto';
      case 'de':
        return GoogleFonts.roboto().fontFamily ?? 'Roboto';
      default:
        return GoogleFonts.roboto().fontFamily ?? 'Roboto';
    }
  }
}
