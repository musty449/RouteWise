import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  // Sample data for deliveries (replace with your actual data model)
  final List<Map<String, dynamic>> _deliveries = [
    {
      'id': '101',
      'pickupLocation': 'A1 Main St, City X',
      'dropoffLocation': 'B2 Oak Ave, City Y',
      'recipientName': 'Alice Smith',
      'deliveryDate': DateTime.now().add(const Duration(days: 1)),
      'deliveryTime': const TimeOfDay(hour: 10, minute: 0),
      'status': 'Order Placed',
      'driverName': 'John Doe',
      'vehicleNumber': 'ABC 123',
      'eventHistory': [
        {'event': 'Order Placed', 'time': DateTime.now().subtract(const Duration(hours: 2))},
        {'event': 'Out for Delivery', 'time': DateTime.now().subtract(const Duration(hours: 1))},
      ],
    },
    {
      'id': '102',
      'pickupLocation': 'C3 Pine Ln, Town P',
      'dropoffLocation': 'D4 Elm St, Town Q',
      'recipientName': 'Bob Johnson',
      'deliveryDate': DateTime.now().add(const Duration(days: 1)),
      'deliveryTime': const TimeOfDay(hour: 14, minute: 30),
      'status': 'Out for Delivery',
      'driverName': 'Jane Smith',
      'vehicleNumber': 'XYZ 456',
      'eventHistory': [
        {'event': 'Order Placed', 'time': DateTime.now().subtract(const Duration(hours: 3))},
        {'event': 'Out for Delivery', 'time': DateTime.now().subtract(const Duration(minutes: 30))},
      ],
    },
    {
      'id': '103',
      'pickupLocation': 'E5 Cedar Rd, Village M',
      'dropoffLocation': 'F6 Maple Dr, Village N',
      'recipientName': 'Charlie Brown',
      'deliveryDate': DateTime.now().add(const Duration(days: 2)),
      'deliveryTime': const TimeOfDay(hour: 11, minute: 0),
      'status': 'Delivered',
      'driverName': 'David Lee',
      'vehicleNumber': 'LMN 789',
      'eventHistory': [
        {'event': 'Order Placed', 'time': DateTime.now().subtract(const Duration(days: 1))},
        {'event': 'Out for Delivery', 'time': DateTime.now().subtract(const Duration(hours: 4))},
        {'event': 'Delivered', 'time': DateTime.now().subtract(const Duration(hours: 1))},
      ],
    },
  ];

  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  String _selectedDeliveryId = ''; // Track selected delivery

  // Function to show delivery details
  void _showDeliveryDetails(Map<String, dynamic> delivery) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delivery Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Delivery ID: ${delivery['id']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Pickup: ${delivery['pickupLocation']}'),
                Text('Dropoff: ${delivery['dropoffLocation']}'),
                Text('Recipient: ${delivery['recipientName']}'),
                Text('Date: ${_dateFormat.format(delivery['deliveryDate'])}'),
                Text('Time: ${delivery['deliveryTime'].format(context)}'),
                Text('Status: ${delivery['status']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Driver: ${delivery['driverName']}'),
                Text('Vehicle: ${delivery['vehicleNumber']}'),
                const SizedBox(height: 15),
                const Text('Event History:', style: TextStyle(fontWeight: FontWeight.bold)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: delivery['eventHistory'].map<Widget>((event) {
                    return Text(
                      '${event['event']} - ${DateFormat('yyyy-MM-dd – kk:mm').format(event['time'])}',
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Deliveries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Track Your Deliveries',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedDeliveryId.isEmpty ? null : _selectedDeliveryId,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDeliveryId = newValue!;
                });
              },
              items: _deliveries.map<DropdownMenuItem<String>>((delivery) {
                return DropdownMenuItem<String>(
                  value: delivery['id'],
                  child: Text('Delivery ID: ${delivery['id']}'),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Select Delivery ID',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a delivery ID';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            if (_selectedDeliveryId.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  // Find the selected delivery and show details
                  final selectedDelivery = _deliveries.firstWhere(
                    (delivery) => delivery['id'] == _selectedDeliveryId,
                  );
                  _showDeliveryDetails(selectedDelivery);
                },
                child: const Text('Show Delivery Details'),
              ),
            if (_selectedDeliveryId.isEmpty)
              const Text('Please select a delivery ID to view details.'),
          ],
        ),
      ),
    );
  }
}

