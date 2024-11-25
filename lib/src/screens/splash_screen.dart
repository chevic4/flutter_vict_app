import 'package:flutter/material.dart';
import 'package:flutter_vict_app/src/config/setup.dart';

class SplashScreen extends StatefulWidget {
  final Widget childWidget;
  const SplashScreen({super.key, required this.childWidget});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future isLoaded;
  @override
  void initState() {
    isLoaded = locator.allReady();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: isLoaded,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return widget.childWidget;
          }
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
