import 'package:flutter/material.dart';

class WeatherInfoRow extends StatelessWidget {
  final String value;
  final String
      type; // Determines which fixed item to display: Sunrise, Sunset, Temp Max, or Temp Min.

  const WeatherInfoRow({
    super.key,
    required this.value,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    // Define the mapping of type to image and label.
    final Map<String, dynamic> info = {
      'Sunrise': {'image': 'assets/11.png', 'label': 'Sunrise'},
      'Sunset': {'image': 'assets/12.png', 'label': 'Sunset'},
      'Temp Max': {'image': 'assets/13.png', 'label': 'Temp Max'},
      'Temp Min': {'image': 'assets/14.png', 'label': 'Temp Min'},
    };

    return Row(
      children: [
        Image.asset(
          info[type]?['image'] ?? '',
          scale: 8,
        ),
        const SizedBox(
          width: 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              info[type]?['label'] ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
