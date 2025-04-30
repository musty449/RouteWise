import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting

class OrderCreationPage extends StatefulWidget {
  const OrderCreationPage({super.key});

  @override
  State<OrderCreationPage> createState() => _OrderCreationPageState();
}

class _OrderCreationPageState extends State<OrderCreationPage> {
  final _formKey = GlobalKey<FormState>();
  final _pickupLocationController = TextEditingController();
  final _dropoffLocationController = TextEditingController();
  final _recipientNameController = TextEditingController();
  final _recipientPhoneController = TextEditingController();
  final _itemDescriptionController = TextEditingController();
  final _deliveryDateController = TextEditingController(); // Controller for the date
  DateTime? _selectedDate; // To store the selected date

  // Initial value for the time.
  TimeOfDay _selectedTime = const TimeOfDay(hour: 9, minute: 0);
  final _dateFormat = DateFormat('yyyy-MM-dd'); // Date format

    // Function to show the time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _deliveryDateController.text = _dateFormat.format(pickedDate); // Update the text field
      });
    }
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    _pickupLocationController.dispose();
    _dropoffLocationController.dispose();
    _recipientNameController.dispose();
    _recipientPhoneController.dispose();
    _itemDescriptionController.dispose();
    _deliveryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView( // Added for scrollability
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _pickupLocationController,
                  decoration: const InputDecoration(
                    labelText: 'Pickup Location',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter pickup location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _dropoffLocationController,
                  decoration: const InputDecoration(
                    labelText: 'Drop-off Location',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter drop-off location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _recipientNameController,
                  decoration: const InputDecoration(
                    labelText: 'Recipient Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter recipient name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _recipientPhoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Recipient Phone',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter recipient phone';
                    }
                    // Basic phone number validation (you can use a package for more robust validation)
                    if (value.length < 10) {
                      return 'Invalid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _itemDescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Item Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter item description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Date Picker
                TextFormField(
                  controller: _deliveryDateController, // Use the controller
                  readOnly: true, // Make it read-only to prevent manual editing
                  decoration: const InputDecoration(
                    labelText: 'Delivery Date',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today), // Add a calendar icon
                  ),
                  onTap: () {
                    _selectDate(context); // Show the date picker when tapped
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select delivery date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Time Picker
                ElevatedButton(
                  onPressed: () {
                    _selectTime(context);
                  },
                  child: const Text('Select Delivery Time'),
                ),
                const SizedBox(height: 10),
                Text(
                  'Delivery Time: ${_selectedTime.format(context)}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform order creation logic here
                      String pickupLocation = _pickupLocationController.text;
                      String dropoffLocation = _dropoffLocationController.text;
                      String recipientName = _recipientNameController.text;
                      String recipientPhone = _recipientPhoneController.text;
                      String itemDescription = _itemDescriptionController.text;
                      String deliveryDate = _deliveryDateController.text;

                      print('Creating order with:');
                      print('Pickup Location: $pickupLocation');
                      print('Drop-off Location: $dropoffLocation');
                      print('Recipient Name: $recipientName');
                      print('Recipient Phone: $recipientPhone');
                      print('Item Description: $itemDescription');
                      print('Delivery Date: $deliveryDate');
                      print('Delivery Time: ${_selectedTime.format(context)}');
                      // After successful order creation, navigate to a confirmation or order tracking page
                      Navigator.pop(context); // For now, just go back
                    }
                  },
                  child: const Text('Create Order'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

