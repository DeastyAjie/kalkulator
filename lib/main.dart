import 'package:flutter/material.dart';
import 'package:kalkulator/nilaisiswa.dart';

void main() => runApp(NilaiSiswaApp());

class NilaiSiswaApp extends StatefulWidget {
  @override
  _NilaiSiswaAppState createState() => _NilaiSiswaAppState();
}

class _NilaiSiswaAppState extends State<NilaiSiswaApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins'
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins'
      ),
      themeMode: _themeMode,
      home: NilaiSiswaScreen(onToggleTheme: _toggleTheme), // Pastikan callback diteruskan
    );
  }
}
