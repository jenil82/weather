import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/provider/weather_provider.dart';
import 'package:weather/screen/view/weather_ui.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomePage(),
        },
      ),
    ),
  );
}