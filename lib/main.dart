import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/login-provider.dart';
import 'package:task/provider/news_list_provider.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(value: NewsListProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:NewsHomeScreen(),
      ),
    );
  }
}
