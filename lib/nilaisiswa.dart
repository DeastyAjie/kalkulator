import 'package:flutter/material.dart';

class NilaiSiswaScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;

  // Pastikan required pada parameter
  NilaiSiswaScreen({required this.onToggleTheme});

  @override
  _NilaiSiswaScreenState createState() => _NilaiSiswaScreenState();
}

class _NilaiSiswaScreenState extends State<NilaiSiswaScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  String _errorMessage = '';

  void _calculateGrade() {
    setState(() {
      _errorMessage = '';
      int? nilai = int.tryParse(_controller.text);

      if (nilai == null || nilai < 0 || nilai > 100) {
        _errorMessage = 'Masukkan nilai antara 0 hingga 100.';
        _result = '';
      } else if (nilai >= 85) {
        _result = 'A';
      } else if (nilai >= 70) {
        _result = 'B';
      } else if (nilai >= 55) {
        _result = 'C';
      } else {
        _result = 'D';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengelompokan Nilai Siswa'),
        actions: [
          IconButton(
            icon: Icon(Theme.of(context).brightness == Brightness.dark
                ? Icons.wb_sunny
                : Icons.nightlight_round),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Nilai Siswa',
                border: OutlineInputBorder(),
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateGrade,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            Text(
              'Kategori Nilai: $_result',
              style: TextStyle(fontSize: 24, fontFamily: 'Poppins'),
            ),
          ],
        ),
      ),
    );
  }
}
