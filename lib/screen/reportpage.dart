import 'package:flutter/material.dart';

enum MedicationStatus { taken, missed, snoozed }

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Today's Report Section
              const Text(
                "Today's Report",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildReportSummaryCard(5, 'Total'),
                  _buildReportSummaryCard(3, 'Taken'),
                  _buildReportSummaryCard(1, 'Missed'),
                  _buildReportSummaryCard(1, 'Snoozed'),
                ],
              ),
              const SizedBox(height: 24),

              // Check Dashboard Section

              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildSectionHeader('Check Dashboard', onTap: () {}),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Here you will find everything related to your active and past medicines',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.blue),
                      ],
                    ),
                  ],
                ),
              ),

              // Check History Section
              _buildSectionHeader('Check History', onTap: () {}),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDayCircle('SUN', 1, isActive: true),
                  _buildDayCircle('MON', 2),
                  _buildDayCircle('TUE', 3),
                  _buildDayCircle('WED', 4),
                  _buildDayCircle('THU', 5),
                  _buildDayCircle('FRI', 6),
                ],
              ),
              const SizedBox(height: 24),

              // Medication Entries
              _buildMedicationEntry(
                time: 'Morning 08:00 am',
                name: 'Calpol 500mg Tablet',
                type: 'Before Breakfast',
                day: 'Day 01',
                status: MedicationStatus.taken,
              ),
              const SizedBox(height: 16),
              _buildMedicationEntry(
                time: 'Morning 08:00 am',
                name: 'Calpol 500mg Tablet',
                type: 'Before Breakfast',
                day: 'Day 27',
                status: MedicationStatus.missed,
              ),
              const SizedBox(height: 16),
              _buildMedicationEntry(
                time: 'Afternoon 02:00 pm',
                name: 'Calpol 500mg Tablet',
                type: 'After Food',
                day: 'Day 01',
                status: MedicationStatus.snoozed,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Medication Status Enum

  // Report Summary Card Widget
  Widget _buildReportSummaryCard(int count, String label) {
    return Column(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          // decoration: BoxDecoration(
          //   color: Colors.blue[50],
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: Center(
            child: Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  // Section Header Widget
  Widget _buildSectionHeader(String title, {VoidCallback? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'View All',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  // Day Circle Widget
  Widget _buildDayCircle(String day, int date, {bool isActive = false}) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.blue : Colors.grey[200],
          ),
          child: Center(
            child: Text(
              date.toString(),
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(day, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // Medication Entry Widget
  Widget _buildMedicationEntry({
    required String time,
    required String name,
    required String type,
    required String day,
    required MedicationStatus status,
  }) {
    Color statusColor;
    IconData statusIcon;

    switch (status) {
      case MedicationStatus.taken:
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case MedicationStatus.missed:
        statusColor = Colors.red;
        statusIcon = Icons.cancel;
        break;
      case MedicationStatus.snoozed:
        statusColor = Colors.orange;
        statusIcon = Icons.snooze;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(Icons.medication, color: Colors.purple),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$type - $day',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Icon(statusIcon, color: statusColor),
              const SizedBox(height: 4),
              Text(
                status == MedicationStatus.taken
                    ? 'Taken'
                    : status == MedicationStatus.missed
                        ? 'Missed'
                        : 'Snoozed',
                style: TextStyle(
                  color: statusColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Bottom Navigation Bar Widget
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Report',
        ),
      ],
      currentIndex: 2, // Highlighting the Report tab
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
