import 'package:flutter/material.dart';

class TextPlaceField extends StatelessWidget {
  const TextPlaceField({super.key});

  @override
  Widget build(BuildContext context) {
    return    const Padding(
            padding: EdgeInsets.all(24),
            child: TextField(
                  decoration: InputDecoration(
                   focusedBorder: OutlineInputBorder(),
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
              enabledBorder: OutlineInputBorder()
            ),
            ),
          );
  }
}