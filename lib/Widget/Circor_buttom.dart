import 'package:flutter/material.dart';

class Circor_Buttom extends StatelessWidget {
  const Circor_Buttom({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final icon;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
