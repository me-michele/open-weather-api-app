import 'package:flutter/material.dart';
import 'package:weather_app/widgets/background_stack.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: BackgroundStack()),
    );
  }
}
