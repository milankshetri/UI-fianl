import 'package:flutter/material.dart';

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Flight'),
      ),
      body: const Center(
        child: Text('Bookings'),
      ),
    );
  }
}
