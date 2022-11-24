import 'package:coded_weather_app/pages/home_page.dart';
import 'package:coded_weather_app/pages/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path: '/weather',
    builder: (context, state) => WeatherPage(),
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
