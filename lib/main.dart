import 'package:flutter/material.dart';
import 'package:hubtel_coding/history_page.dart';
import 'package:hubtel_coding/other_page.dart';

import 'bottom_naviagation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHubtelApp(),
    );
  }
}

// This widget represents the main app
class MyHubtelApp extends StatefulWidget {
  const MyHubtelApp({super.key});

  @override
  State<MyHubtelApp> createState() => _MyHubtelAppState();
}

class _MyHubtelAppState extends State<MyHubtelApp> {
  int currentState = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [
        OtherPage(title: 'Home'),
        OtherPage(title: 'Send'),
        HistoryPage(),
        OtherPage(title: 'Scheduled'),
      ][currentState],
      bottomNavigationBar: MyAppBottomNavBar(
        currentPage: currentState,
        onPageChange: (page) => setState(() => currentState = page),
      ),
    );
  }
}
