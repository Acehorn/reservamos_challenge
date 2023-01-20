import 'package:flutter/material.dart';

class CardPlace extends StatelessWidget {

  final String placeLocation;
  final String temperature;
  const CardPlace({super.key, required this.placeLocation, required this.temperature});

  @override
  Widget build(BuildContext context) {
       final themeData = Theme.of(context);
    return       Card(
             shape: RoundedRectangleBorder(
    side:  BorderSide(
      color: themeData.colorScheme.onPrimary
    ),
   borderRadius: BorderRadius.circular(15),
        
            
  ),
            child: SizedBox(
              height: 400,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text(placeLocation, style: themeData.textTheme.titleLarge),
                  Text(temperature,  style: themeData.textTheme.titleLarge),
                ],
              )),
           );
  }
}