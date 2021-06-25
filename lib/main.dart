import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:healthcenter/stateless/bottomnavigationbar.dart';
import 'package:healthcenter/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: MyThemes.darkTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          title: 'Health Center',
          home: BottomNavigationBarExample(),
        ),
      ),
    );
  }
}
