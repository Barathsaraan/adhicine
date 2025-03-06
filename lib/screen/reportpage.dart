import 'package:flutter/material.dart';

enum MedicationStatus { taken, missed, snoozed, left }

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Report',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildReportCard(),
              const SizedBox(height: 16),
              _buildDashboardCard(),
              const SizedBox(height: 16),
              _buildHistorySection(),
              const SizedBox(height: 16),
              _buildTimeSection('Morning 08:00 am', [
                _buildMedicationItem(
                  'Calpol 500mg Tablet',
                  'Before Breakfast',
                  'Day 01',
                  MedicationStatus.taken,
                  Colors.purple[100]!,
                ),
                const SizedBox(height: 12),
                _buildMedicationItem(
                  'Calpol 500mg Tablet',
                  'Before Breakfast',
                  'Day 27',
                  MedicationStatus.missed,
                  Colors.pink[100]!,
                ),
              ]),
              const SizedBox(height: 20),
              _buildTimeSection('Afternoon 02:00 pm', [
                _buildMedicationItem(
                  'Calpol 500mg Tablet',
                  'After Food',
                  'Day 01',
                  MedicationStatus.snoozed,
                  Colors.purple[100]!,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportCard() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Report",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildReportItem('5', 'Total', Colors.blue),
              _buildReportItem('3', 'Taken', Colors.blue),
              _buildReportItem('1', 'Missed', Colors.blue),
              _buildReportItem('1', 'Snoozed', Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Check Dashboard",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Here you will find everything related to your active and past medicines.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CustomPaint(
              painter: CircularProgressPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Check History",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.blue[400]),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDayCircle('SUN', '1', isSelected: true),
            _buildDayCircle('MON', '2'),
            _buildDayCircle('TUE', '3'),
            _buildDayCircle('WED', '4'),
            _buildDayCircle('THU', '5'),
            _buildDayCircle('FRI', '6'),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeSection(String timeTitle, List<Widget> medications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          timeTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: medications,
          ),
        ),
      ],
    );
  }

  Widget _buildReportItem(String count, String label, Color color) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildDayCircle(String day, String date, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue[400] : Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              date,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMedicationItem(
    String name,
    String details,
    String day,
    MedicationStatus status,
    Color bgColor,
  ) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Icon(
              Icons.water_drop_outlined,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                "$details    $day",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        _getStatusIcon(status),
      ],
    );
  }

  Widget _getStatusIcon(MedicationStatus status) {
    switch (status) {
      case MedicationStatus.taken:
        return const Icon(Icons.check_circle_outline, color: Colors.green);
      case MedicationStatus.missed:
        return const Icon(Icons.cancel_outlined, color: Colors.red);
      case MedicationStatus.snoozed:
        return const Icon(Icons.access_time_outlined, color: Colors.orange);
      case MedicationStatus.left:
        return const Icon(Icons.circle_outlined, color: Colors.blue);
    }
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home_outlined, color: Colors.grey[400]),
              const SizedBox(height: 4),
              Text(
                'Home',
                style: TextStyle(color: Colors.grey[400], fontSize: 12),
              ),
            ],
          ),
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bar_chart, color: Colors.black),
              SizedBox(height: 4),
              Text(
                'Report',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final bgPaint = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    canvas.drawCircle(center, radius - 4, bgPaint);

    final rect = Rect.fromCircle(center: center, radius: radius - 4);

    final paint1 = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -1.57,
      0.8,
      false,
      paint1,
    );

    final paint2 = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -0.77,
      1.0,
      false,
      paint2,
    );

    final paint3 = Paint()
      ..color = Colors.pink[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      0.23,
      0.77,
      false,
      paint3,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
