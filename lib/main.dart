import 'package:aura_patient/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/FBProvider.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: FBProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
          appBarTheme: AppBarTheme(
            color: Colors.blueGrey,
          ),
        ),
        home: LoginPage(),
      ),
    );
  }
}
