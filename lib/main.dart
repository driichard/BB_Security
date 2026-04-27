import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/view/login_page.dart';
import 'features/auth/viewmodel/login_viewmodel.dart';
import 'features/analyze/viewmodel/analyze_viewmodel.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => AnalyzeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}