import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    const HomeView(),
    const ProfileView(),
    const AboutView(),
    const CartView(),
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
