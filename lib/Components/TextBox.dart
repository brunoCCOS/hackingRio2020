import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  static bool selected = false;
  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return new AnimatedContainer(
      width: TextBox.selected ? 200.0 : 0,
      height: TextBox.selected ? 100.0 : 0,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: TextFormField(
        decoration: new InputDecoration(
          filled: true,
          labelText: "Ponha o codigo de rastreamento",
          fillColor: Colors.grey,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
        ),
        validator: (val) {
          if (val.length == 0) {
            return "Código não pode estar vazio";
          } else {
            return null;
          }
        },
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
