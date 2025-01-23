import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:weather_app/widgets/circle_shaped_container.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          AlignedCircle(x: 3, y: -0.3),
          AlignedCircle(x: -3, y: -0.3),
          AlignedCircle(
            x: 0,
            y: -1.2,
            height: 300,
            width: 600,
            color: Colors.orange,
            isSquare: true,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📍 Bangkok',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Good Morning',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
