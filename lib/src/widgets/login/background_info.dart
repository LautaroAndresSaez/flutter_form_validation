import 'package:flutter/material.dart';

class BackgroundInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Icon(Icons.person_pin_circle, color: Colors.white, size: 100),
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            Text(
              'Lautaro Andres Saez',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
