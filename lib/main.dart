import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'pages/home_page.dart';

void main() {
  MpesaFlutterPlugin.setConsumerKey("3XerNvCpN0CQflD9Y3NpqGf9GVsRYPAv");
  MpesaFlutterPlugin.setConsumerSecret("SZZmeAAylz64QDfn");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mpesa-Integration',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}
