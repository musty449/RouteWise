import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class RouteManagementPage extends StatefulWidget {
  const RouteManagementPage({super.key});

  @override
  State<RouteManagementPage> createState() => _RouteManagementPageState();
}

class _RouteManagementPageState extends State<RouteManagementPage> {
  // Sample data for orders (replace with your actual data model)
  final List<Map<String, dynamic>> _orders = [
    {
      'id': '1',
      'pickupLocation': '123 Main St',
      'dropoffLocation': '456 Oak Ave',
      'recipientName': 'Alice Smith',
      'deliveryDate': DateTime.now().add(const Duration(days: 1)),
      'deliveryTime': const TimeOfDay(hour: 10, minute: 0),
      'status': 'Pending',
    },
    {
      'id': '2',
      'pickupLocation': '789 Pine Ln',
      'dropoffLocation': '246 Elm St',
      'recipientName': 'Bob Johnson',
      'deliveryDate': DateTime.now().add(const Duration(days: 1)),
      'deliveryTime': const TimeOfDay(hour: 14, minute: 30),
      'status': 'Pending',
    },
    {
      'id': '3',
      'pickupLocation': '321 Cedar Rd',
      'dropoffLocation': '654 Maple Dr',
      'recipientName': 'Charlie Brown',
      'deliveryDate': DateTime.now().add(const Duration(days: 2)),
      'deliveryTime': const TimeOfDay(hour: 11, minute: 0),
      'status': 'Pending',
    },
  ];

  // Date formatter
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  // Function to show order details in a dialog
  void _showOrderDetails(BuildContext context, Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Order Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Order ID: ${order['id']}'),
              Text('Pickup: ${order['pickupLocation']}'),
              Text('Dropoff: ${order['dropoffLocation']}'),
              Text('Recipient: ${order['recipientName']}'),
              Text('Date: ${_dateFormat.format(order['deliveryDate'])}'),
              Text('Time: ${order['deliveryTime'].format(context)}'),
              Text('Status: ${order['status']}'),
              // Add more order details here
            ],
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

  // Function to reorder the list
  void _reorderOrders(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Map<String, dynamic> order = _orders.removeAt(oldIndex);
      _orders.insert(newIndex, order);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Routes'),
        actions: [
          IconButton(
            onPressed: () {
              //show add order page
              Navigator.pushNamed(context, '/order_creation');
            },
            icon: const Icon(Icons.add_circle),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Planned Routes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ReorderableListView.builder(
                onReorder: _reorderOrders,
                itemBuilder: (context, index) {
                  final order = _orders[index];
                  return Card(
                    key: ValueKey(order['id']), // Use a unique key for each card
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      onTap: () => _showOrderDetails(context, order),
                      title: Text(
                        '${order['pickupLocation']} - ${order['dropoffLocation']}',
                      ),
                      subtitle: Text(
                        '${_dateFormat.format(order['deliveryDate'])} ${order['deliveryTime'].format(context)}',
                      ),
                      trailing: const Icon(Icons.reorder), // Icon for reordering
                    ),
                  );
                },
                itemCount: _orders.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

