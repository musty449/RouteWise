import 'package:flutter/material.dart';
import 'package:routewise/Billing_page.dart';
import 'package:routewise/Customerprofile_page.dart';
import 'package:routewise/Customersupport_page.dart';
import 'package:routewise/Dashboard_page.dart';
import 'package:routewise/DriverManagement_page.dart';
import 'package:routewise/Map_page.dart';
import 'package:routewise/Notification_page.dart';
import 'package:routewise/OrderCreation_page.dart';
import 'package:routewise/PodManagement_page.dart';
import 'package:routewise/Report_page.dart';
import 'package:routewise/RouteManagement_page.dart';
import 'package:routewise/Settings_page.dart';
import 'package:routewise/Signin_page.dart';
import 'package:routewise/Signu_page.dart';
import 'package:routewise/Tracking_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RouteWise',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInPage(), // Start with the sign-in page
      routes: {
        '/signup': (context) => const SignUpPage(),
        '/profile': (context) => const CustomerProfilePage(),
        '/dashboard': (context) => const DashboardPage(),
        '/tracking': (context) => const TrackingPage(),
        '/support': (context) => const CustomerSupportPage(),
        '/notifications': (context) => const NotificationPage(),
        '/route': (context) => const RouteManagementPage(),
        '/map': (context) => const MapIntegrationPage(),
        '/order_creation': (context) => const OrderCreationPage(),
        '/driver_management': (context) => const DriverManagementPage(),
        // '/vehicle_management': (context) => const VehicleManagementPage(),
        '/pricing': (context) => const PricingBillingPage(),
        '/reports': (context) => const ReportingAnalyticsPage(),
        '/settings': (context) => const SettingsPage(),
        // '/help': (context) => const HelpDocumentationPage(),
        '/pod': (context) => const PODManagementPage(),
      },
    );
  }
}

class VehicleManagementPage {
  const VehicleManagementPage();
}