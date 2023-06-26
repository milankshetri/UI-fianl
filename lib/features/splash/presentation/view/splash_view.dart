import 'package:airfly/features/splash/presentation/viewmodel/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      ref.read(splashViewModelProvider.notifier).init(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Airline Ticket Booking',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text('version : 1.0.0')
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width / 4,
            child: const Text(
              'Developed by: Satish Pradhan',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
