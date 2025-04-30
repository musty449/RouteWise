import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Welcome, [Business Name]!', // Replace with actual business name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Key Metrics Section
            const Text(
              'Key Metrics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildMetricCard(
                  title: 'Active Deliveries',
                  value: '15', // Replace with actual data
                  icon: Icons.local_shipping,
                  color: Colors.blue.shade200,
                ),
                _buildMetricCard(
                  title: 'Completed Today',
                  value: '28', // Replace with actual data
                  icon: Icons.check_circle_outline,
                  color: Colors.green.shade200,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildMetricCard(
                  title: 'Pending Deliveries',
                  value: '2', // Replace with actual data
                  icon: Icons.warning_amber_outlined,
                  color: Colors.orange.shade200,
                ),
                _buildMetricCard(
                  title: 'Total Vehicles',
                  value: '5', // Replace with actual data
                  icon: Icons.directions_car_filled,
                  color: Colors.purple.shade200,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Quick Actions Section
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                _buildActionButton(
                  context: context,
                  title: 'Create New Order',
                  icon: Icons.add_box_outlined,
                  route: '/order_creation',
                ),
                _buildActionButton(
                  context: context,
                  title: 'Manage Routes',
                  icon: Icons.route_outlined,
                  route: '/route',
                ),
                _buildActionButton(
                  context: context,
                  title: 'Track Deliveries',
                  icon: Icons.map_outlined,
                  route: '/tracking',
                ),
                _buildActionButton(
                  context: context,
                  title: 'View Reports',
                  icon: Icons.assessment_outlined,
                  route: '/reports',
                ),
                // Add more quick actions as needed
              ],
            ),
            const SizedBox(height: 20),
            // Recent Activity Section (Example - you might fetch actual recent activity)
            const Text(
              'Recent Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.local_shipping),
              title: const Text('Delivery #123 updated to "Out for Delivery"'),
              subtitle: const Text('5 minutes ago'),
            ),
            ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: const Text('Delivery #122 completed successfully'),
              subtitle: const Text('30 minutes ago'),
            ),
            // Add more recent activity items
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String route,
  }) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
    );
  }
}