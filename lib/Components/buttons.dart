import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  static bool first = true;
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 1),
      firstChild: Image(image: AssetImage('assets/cliente_off.png')),
      secondChild: Image(image: AssetImage('assets/cliente_on.png')),
      crossFadeState:
          Delivery.first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

class LogoButton extends StatelessWidget {
  final Function action;
  LogoButton({this.action});
  @override

  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: action,
      child: Image(
        image: AssetImage('assets/icone_app.png'),
      ),
      backgroundColor: Colors.black,
    );
  }
}
