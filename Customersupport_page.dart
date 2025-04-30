// 6. Customer Support Page
import 'package:flutter/material.dart';

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Support')),
      body: const Center(
        child: Text('Customer Support Page Content'),
      ),
    );
  }
}