import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:fl_chart/fl_chart.dart'; // Import for charts

class ReportingAnalyticsPage extends StatefulWidget {
  const ReportingAnalyticsPage({super.key});

  @override
  State<ReportingAnalyticsPage> createState() => _ReportingAnalyticsPageState();
}

class _ReportingAnalyticsPageState extends State<ReportingAnalyticsPage> {
  // Sample data (replace with your actual data fetching logic)
  final List<Map<String, dynamic>> _deliveryData = [
    {
      'date': DateTime.now().subtract(const Duration(days: 6)),
      'deliveries': 10,
      'successRate': 0.9,
      'averageTime': 35, // in minutes
    },
    {
      'date': DateTime.now().subtract(const Duration(days: 5)),
      'deliveries': 12,
      'successRate': 0.95,
      'averageTime': 40,
    },
    {
      'date': DateTime.now().subtract(const Duration(days: 4)),
      'deliveries': 15,
      'successRate': 0.88,
      'averageTime': 45,
    },
    {
      'date': DateTime.now().subtract(const Duration(days: 3)),
      'deliveries': 18,
      'successRate': 0.92,
      'averageTime': 38,
    },
    {
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'deliveries': 20,
      'successRate': 0.98,
      'averageTime': 32,
    },
    {
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'deliveries': 22,
      'successRate': 0.96,
      'averageTime': 30,
    },
    {
      'date': DateTime.now(),
      'deliveries': 25,
      'successRate': 0.94,
      'averageTime': 33,
    },
  ];

  // Date formatter
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  // Function to build the deliveries chart
  Widget _buildDeliveriesChart() {
    List<charts.Series<Map<String, dynamic>, DateTime>> seriesList = [
      charts.Series<Map<String, dynamic>, DateTime>(
        id: 'Deliveries',
        data: _deliveryData,
        domainFn: (Map<String, dynamic> data, _) => data['date'],
        measureFn: (Map<String, dynamic> data, _) => data['deliveries'],
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),
    ];

    return SizedBox(
      height: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Number of Deliveries Over Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.TimeSeriesChart(
                  seriesList,
                  animate: true,
                  dateTimeAxis: const charts.DateTimeAxisSpec(
                    tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                      day: charts.TimeFormatterSpec(
                        format: 'MMM dd',
                        transitionFormat: 'MMM dd',
                      ),
                    ),
                  ),
                  defaultRenderer: charts.LineRendererConfig(
                    includePoints: true,
                    includeArea: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build the success rate chart
  Widget _buildSuccessRateChart() {
    List<charts.Series<Map<String, dynamic>, DateTime>> seriesList = [
      charts.Series<Map<String, dynamic>, DateTime>(
        id: 'Success Rate',
        data: _deliveryData,
        domainFn: (Map<String, dynamic> data, _) => data['date'],
        measureFn: (Map<String, dynamic> data, _) => data['successRate'],
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      ),
    ];

    return SizedBox(
      height: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Delivery Success Rate Over Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.TimeSeriesChart(
                  seriesList,
                  animate: true,
                  dateTimeAxis: const charts.DateTimeAxisSpec(
                    tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                      day: charts.TimeFormatterSpec(
                        format: 'MMM dd',
                        transitionFormat: 'MMM dd',
                      ),
                    ),
                  ),
                  defaultRenderer: charts.LineRendererConfig(
                    includePoints: true,
                    includeArea: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build the average delivery time chart
  Widget _buildAverageTimeChart() {
    List<charts.Series<Map<String, dynamic>, DateTime>> seriesList = [
      charts.Series<Map<String, dynamic>, DateTime>(
        id: 'Average Time',
        data: _deliveryData,
        domainFn: (Map<String, dynamic> data, _) => data['date'],
        measureFn: (Map<String, dynamic> data, _) => data['averageTime'],
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
      ),
    ];

    return SizedBox(
      height: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Average Delivery Time Over Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.TimeSeriesChart(
                  seriesList,
                  animate: true,
                  dateTimeAxis: const charts.DateTimeAxisSpec(
                    tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                      day: charts.TimeFormatterSpec(
                        format: 'MMM dd',
                        transitionFormat: 'MMM dd',
                      ),
                    ),
                  ),
                  defaultRenderer: charts.LineRendererConfig(
                    includePoints: true,
                    includeArea: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporting & Analytics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Key Performance Indicators',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildDeliveriesChart(),
              const SizedBox(height: 20),
              _buildSuccessRateChart(),
              const SizedBox(height: 20),
              _buildAverageTimeChart(),
              // Add more charts or summary data here
            ],
          ),
        ),
      ),
    );
  }
}

