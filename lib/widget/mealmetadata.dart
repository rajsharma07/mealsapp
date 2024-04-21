
import 'package:flutter/material.dart';

class MealMetaData extends StatelessWidget {
  const MealMetaData({
    super.key,
    required this.data,
    required this.icon,
  });

  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.white,
        ),
        const SizedBox(),
        Text(
          data,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20,),
        
      ],
    );
  }
}
