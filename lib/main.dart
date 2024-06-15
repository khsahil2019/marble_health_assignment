import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marble_health_assignment/data/form_data.dart';
import 'package:marble_health_assignment/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(), // naviagte to homescreen *sahil khan*
      ),
    );
  }
}
