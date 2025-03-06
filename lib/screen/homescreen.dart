import 'package:adhicine/screen/addmedicine.dart';
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
  final List<Map<String, dynamic>> _medications = [
    {
      'name': 'Calpol 500mg Tablet',
      'time': '08:00 am',
      'timeCategory': 'Morning',
      'type': 'Before Breakfast',
      'day': 'Day 01',
      'status': 'Taken',
      'color': const Color.fromARGB(255, 208, 221, 234),
      'icon': Icons.water_drop,
      'iconColor': const Color(0xFFF684A5),
    },
    {
      'name': 'Calpol 500mg Tablet',
      'time': '08:00 am',
      'timeCategory': 'Morning',
      'type': 'Before Breakfast',
      'day': 'Day 27',
      'status': 'Missed',
      'color': const Color.fromARGB(255, 208, 221, 234),
      'icon': Icons.healing,
      'iconColor': const Color(0xFF92C4F8),
    },
    {
      'name': 'Calpol 500mg Tablet',
      'time': '02:00 pm',
      'timeCategory': 'Afternoon',
      'type': 'After Food',
      'day': 'Day 01',
      'status': 'Snoozed',
      'color': const Color.fromARGB(255, 208, 221, 234),
      'icon': Icons.water_drop,
      'iconColor': const Color(0xFFC284F6),
    },
    {
      'name': 'Calpol 500mg Tablet',
      'time': '09:00 pm',
      'timeCategory': 'Night',
      'type': 'Before Sleep',
      'day': 'Day 03',
      'status': 'Left',
      'color': const Color.fromARGB(255, 208, 221, 234),
      'icon': Icons.edit,
      'iconColor': const Color(0xFFF68484),
    },
  ];

  DateTime _currentDate = DateTime.now();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              const Text(
                'Hi Harry!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.medical_information, color: Colors.blue),
                onPressed: () {},
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  radius: 18,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _buildHomeContent(),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, 'Home', 0, _selectedIndex == 0),
            const SizedBox(width: 80),
            _buildNavItem(Icons.bar_chart, 'Report', 1, _selectedIndex == 1),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          color: Color(0xFF222E3E),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddMedicineScreen()),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildReportPageNavigator() {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => const ReportPage(),
      ),
    );
  }

  Widget _buildHomeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 5.0),
          child: Text(
            '5 Medicines Left',
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _getDayLabels()[0],
                style: TextStyle(color: Colors.grey[500]),
              ),
              Text(
                _getDayLabels()[1],
                style: TextStyle(color: Colors.grey[500]),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, color: Colors.black),
                    onPressed: () => _changeDate(-1),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF222E3E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      DateFormat('EEEE, MMM d').format(_currentDate),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, color: Colors.black),
                    onPressed: () => _changeDate(1),
                  ),
                ],
              ),
              Text(
                _getDayLabels()[3],
                style: TextStyle(color: Colors.grey[500]),
              ),
              Text(
                _getDayLabels()[4],
                style: TextStyle(color: Colors.grey[500]),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _groupMedicationsByTime(),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _groupMedicationsByTime() {
    Map<String, List<Map<String, dynamic>>> groupedMedications = {};

    for (var med in _medications) {
      groupedMedications.putIfAbsent(med['timeCategory'], () => []).add(med);
    }

    List<Widget> sections = [];
    groupedMedications.forEach((timeCategory, medications) {
      sections.add(
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 15.0, bottom: 10.0),
          child: Text(
            '$timeCategory ${timeCategory == "Morning" ? "08:00 am" : timeCategory == "Afternoon" ? "02:00 pm" : "09:00 pm"}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
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

  Widget _buildMedicationCard(Map<String, dynamic> medication) {
    Widget statusIcon;

    switch (medication['status']) {
      case 'Taken':
        statusIcon = Icon(Icons.notifications_active, color: Colors.green[400]);
        break;
      case 'Missed':
        statusIcon = Icon(Icons.notifications_active, color: Colors.red[400]);
        break;
      case 'Snoozed':
        statusIcon =
            Icon(Icons.notifications_active, color: Colors.orange[400]);
        break;
      case 'Left':
        statusIcon = Icon(Icons.notifications_none, color: Colors.grey[600]);
        break;
      default:
        statusIcon = Icon(Icons.notifications_none, color: Colors.grey[600]);
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: medication['color'],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: medication['iconColor'],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              medication['icon'],
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medication['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      medication['type'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      medication['day'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              statusIcon,
              const SizedBox(height: 4),
              Text(
                medication['status'],
                style: TextStyle(
                  fontSize: 12,
                  color: _getStatusColor(medication['status']),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, int index, bool isSelected) {
    return GestureDetector(
      onTap: () {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReportPage()),
          );
        } else {
          setState(() => _selectedIndex = index);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
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
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  List<String> _getDayLabels() {
    final days = [
      _currentDate.subtract(const Duration(days: 2)),
      _currentDate.subtract(const Duration(days: 1)),
      _currentDate,
      _currentDate.add(const Duration(days: 1)),
      _currentDate.add(const Duration(days: 2)),
    ];
    return days.map((date) => DateFormat('EEE').format(date)).toList();
  }

  void _changeDate(int daysToAdd) {
    setState(() {
      _currentDate = DateTime(
        _currentDate.year,
        _currentDate.month,
        _currentDate.day + daysToAdd,
      );
    });
  }
}
