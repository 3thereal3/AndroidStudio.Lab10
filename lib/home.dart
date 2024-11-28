import 'package:flutter/material.dart';
import 'text_preview.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  double _fontSize = 12.0;

  Future<void> _showDialog(String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090',
                width: 50,
                height: 50,
              ),
              SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _validateAndNavigate() {
    if (_textController.text.isEmpty) {
      _showDialog('Please enter some text to preview!');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TextPreview(
            text: _textController.text,
            fontSize: _fontSize,
          ),
        ),
      ).then((result) {
        if (result == 'ok') {
          _showDialog('Cool!');
        } else if (result == 'cancel') {
          _showDialog('Let’s try something else');
        } else {
          _showDialog("Don't know what to say");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Previewer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(fontSize: 14, color: Colors.white),
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Enter your text',
                  labelStyle: TextStyle(color: Colors.blue),
                  border: InputBorder.none,
                  hintText: 'Type something...',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Font size: ${_fontSize.toInt()}',
                    style: TextStyle(color: Colors.white)),
                Expanded(
                  child: Slider(
                    value: _fontSize,
                    min: 10,
                    max: 100,
                    divisions: 18,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey[600],
                    label: _fontSize.toInt().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _fontSize = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: _validateAndNavigate,
              child: Text(
                'Preview',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
