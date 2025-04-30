// 3. Customer Profile Page
import 'package:flutter/material.dart';

class CustomerProfilePage extends StatelessWidget {
  const CustomerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Profile')),
      body: const Center(
        child: Text('Customer Profile Page Content'),
      ),
    );
  }
}
