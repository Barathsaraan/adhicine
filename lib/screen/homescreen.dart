import 'package:adhicine/screen/profilepage.dart';
import 'package:adhicine/screen/reportpage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Medication data with more detailed structure
  final List<Map<String, dynamic>> _medications = [
    {
      'name': 'Calpol 500mg Tablet',
      'time': '08:00 am',
      'timeCategory': 'Morning',
      'type': 'Before Breakfast',
      'day': 'Day 01',
      'status': 'Taken',
      'color': Colors.pink[100],
      'icon': Icons.wb_sunny_outlined
    },
    {
      'name': 'Calpol 500mg Tablet',
      'time': '08:00 am',
      'timeCategory': 'Morning',
      'type': 'Before Breakfast',
      'day': 'Day 27',
      'status': 'Missed',
      'color': Colors.blue[100],
      'icon': Icons.wb_sunny_outlined
    },
    {
      'name': 'Calpol 500mg Tablet',
      'time': '02:00 pm',
      'timeCategory': 'Afternoon',
      'type': 'After Food',
      'day': 'Day 01',
      'status': 'Snoozed',
      'color': Colors.purple[100],
      'icon': Icons.wb_cloudy_outlined
    },
    {
      'name': 'Calpol 500mg Tablet',
      'time': '09:00 pm',
      'timeCategory': 'Night',
      'type': 'Before Sleep',
      'day': 'Day 03',
      'status': 'Left',
      'color': Colors.red[100],
      'icon': Icons.nightlight_outlined
    },
  ];

  DateTime _currentDate = DateTime.now();
  final String _username = 'Harry';
  int _selectedIndex = 0;

  void _changeDate(bool isNext) {
    setState(() {
      _currentDate = isNext
          ? _currentDate.add(const Duration(days: 1))
          : _currentDate.subtract(const Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Text(
              'Hi Harry!',
              style: TextStyle(color: Colors.black),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfilePage();
                }));
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfilePage();
                }));
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
                radius: 20,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Date Navigation Row with Previous and Next Dates
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('EEE, MMM d')
                      .format(_currentDate.subtract(const Duration(days: 1))),
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () => _changeDate(false),
                    ),
                    Container(
                      // margin: const EdgeInsets.symmetric(horizontal: 16),
                      // alignment: Alignment.center,
                      // width: 100,
                      // height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        DateFormat('EEEE, MMM d').format(_currentDate),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () => _changeDate(true),
                    ),
                  ],
                ),
                Text(
                  DateFormat('EEE, MMM d')
                      .format(_currentDate.add(const Duration(days: 1))),
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          // Medicines Left Indicator
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '5 Medicines Left',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Medications Grouped by Time
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _groupMedicationsByTime(),
              ),
            ),
          ),
        ],
      ),

      // Custom Bottom Navigation
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildCenterAddButton(),
            _buildNavItem(Icons.report_outlined, 'Report', 1),
          ],
        ),
      ),
    );
  }

  // Group medications by time category
  List<Widget> _groupMedicationsByTime() {
    Map<String, List<Map<String, dynamic>>> groupedMedications = {};

    for (var med in _medications) {
      groupedMedications.putIfAbsent(med['timeCategory'], () => []).add(med);
    }

    List<Widget> sections = [];
    groupedMedications.forEach((timeCategory, medications) {
      sections.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            '$timeCategory ${timeCategory == "Morning" ? "08:00 am" : timeCategory == "Afternoon" ? "02:00 pm" : "09:00 pm"}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );

      sections.addAll(medications
          .map((medication) => _buildMedicationCard(medication))
          .toList());
    });

    return sections;
  }

  // Build individual medication card
  Widget _buildMedicationCard(Map<String, dynamic> medication) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: medication['color'],
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(medication['icon'], size: 40),
        title: Text(
          medication['name'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${medication['type']} • ${medication['day']}',
        ),
        trailing: Text(
          medication['status'],
          style: TextStyle(
            color: _getStatusColor(medication['status']),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Build bottom navigation items
  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = index);
        if (index == 1) {
          // If "Report" is selected
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReportPage()),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? Colors.black : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.black : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Build center add button
  Widget _buildCenterAddButton() {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Taken':
        return Colors.green;
      case 'Missed':
        return Colors.red;
      case 'Snoozed':
        return Colors.orange;
      case 'Left':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }
}
