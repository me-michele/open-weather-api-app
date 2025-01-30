import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/circle_shaped_container.dart';
import 'package:weather_app/widgets/weather_info_row.dart';

Widget buildBackgroundCircles() {
  return Stack(
    children: const [
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
    ],
  );
}

Widget buildBlurEffect() {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
    child: Container(
      decoration: const BoxDecoration(color: Colors.transparent),
    ),
  );
}

Widget buildWeatherInfoRow(
    String type1, String value1, String type2, String value2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      WeatherInfoRow(type: type1, value: value1),
      WeatherInfoRow(type: type2, value: value2),
    ],
  );
}

Widget buildErrorMessage(String? message) {
  return Center(
    child: Text(
      message ?? 'Failed to load weather data',
      style: const TextStyle(
        color: Colors.red,
        fontSize: 16,
      ),
    ),
  );
}

Widget buildLocationAndGreeting(String? areaName) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '📍 ${areaName ?? 'Unknown'}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'Good Morning',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget getWeatherIcon(int weatherCode) {
  if (weatherCode >= 200 && weatherCode < 300) {
    return Image.asset('assets/1.png');
  } else if (weatherCode >= 300 && weatherCode < 400) {
    return Image.asset('assets/2.png');
  } else if (weatherCode >= 500 && weatherCode < 600) {
    return Image.asset('assets/3.png');
  } else if (weatherCode >= 600 && weatherCode < 700) {
    return Image.asset('assets/4.png');
  } else if (weatherCode >= 700 && weatherCode < 800) {
    return Image.asset('assets/5.png');
  } else if (weatherCode == 800) {
    return Image.asset('assets/6.png');
  } else if (weatherCode > 800 && weatherCode <= 804) {
    return Image.asset('assets/7.png');
  } else {
    return Image.asset('assets/7.png'); // Default icon
  }
}

Widget buildMainWeatherInfo(
    int? temperature, String? weatherMain, String? date, int? weatherCode) {
  return Column(
    children: [
      getWeatherIcon(weatherCode ?? 0),
      Center(
        child: Text(
          '${temperature ?? 'N/A'} °C',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 55,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Center(
        child: Text(
          weatherMain ?? 'N/A',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      const SizedBox(height: 5),
      Center(
        child: Text(
          date ?? 'N/A',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    ],
  );
}

String formatTime(DateTime? dateTime) {
  if (dateTime == null) return 'N/A'; // Handle null case
  try {
    return DateFormat('h:mm a')
        .format(dateTime.toLocal()); // Format as '6:30 am'
  } catch (e) {
    return 'N/A'; // Return default in case of error
  }
}
