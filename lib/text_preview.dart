import 'package:flutter/material.dart';

class TextPreview extends StatelessWidget {
  final String text;
  final double fontSize;

  const TextPreview({Key? key, required this.text, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: fontSize, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'ok');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Синий фон
                    foregroundColor: Colors.white, // Белый текст
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Округленные углы
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Увеличение размеров
                  ),
                  child: Text(
                    'OK',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue, width: 2), // Синяя граница
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Округленные углы
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Увеличение размеров
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
