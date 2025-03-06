import 'package:flutter/material.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  _AddMedicineScreenState createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  int _selectedCompartment = 1;

  final List<Color> _colorOptions = [
    const Color(0xFFFFC0CB),
    const Color(0xFFD8BFD8),
    const Color(0xFFFFA07A),
    const Color(0xFF90EE90),
    const Color(0xFFFFA500),
    const Color(0xFF87CEEB),
    const Color(0xFFFFFF00),
  ];
  Color? _selectedColor;

  final List<Map<String, dynamic>> _medicineTypes = [
    {'name': 'Tablet', 'icon': Icons.circle},
    {'name': 'Capsule', 'icon': Icons.medication},
    {'name': 'Cream', 'icon': Icons.sanitizer},
    {'name': 'Liquid', 'icon': Icons.opacity},
  ];
  String? _selectedType;

  String _quantity = "1/2";
  int _totalCount = 1;

  DateTime? _startDate;
  DateTime? _endDate;

  String _frequencyType = 'Everyday';
  final List<String> _frequencyOptions = ['Everyday', 'Once in 2 Days'];

  String _timesPerDay = 'Three Time';
  final List<String> _timesPerDayOptions = [
    'One Time',
    'Two Time',
    'Three Time'
  ];

  String _doseTiming = 'Before Food';
  final List<String> _doseTimingOptions = [
    'Before Food',
    'After Food',
    'Before Sleep'
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medicines'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search Medicine Name',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Compartment',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCompartment = index + 1;
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: _selectedCompartment == index + 1
                                ? Colors.blue[100]
                                : Colors.white,
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: _selectedCompartment == index + 1
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: _selectedCompartment == index + 1
                                    ? Colors.blue[800]
                                    : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Colour',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _colorOptions
                      .map((color) => Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = color;
                                });
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: _selectedColor == color
                                      ? Border.all(color: Colors.blue, width: 2)
                                      : null,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Type',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _medicineTypes
                      .map((type) => Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedType = type['name'];
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: _selectedType == type['name']
                                          ? Colors.pink[100]
                                          : Colors.grey[200],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      type['icon'],
                                      color: _selectedType == type['name']
                                          ? Colors.pink
                                          : Colors.grey[600],
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    type['name'],
                                    style: TextStyle(
                                      color: _selectedType == type['name']
                                          ? Colors.black
                                          : Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Quantity',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Take $_quantity Pill',
                        style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.remove, color: Colors.blue),
                      onPressed: () {
                        setState(() {
                          if (_quantity == "1") {
                            _quantity = "1/2";
                          } else if (_quantity == "2") {
                            _quantity = "1";
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          if (_quantity == "1/2") {
                            _quantity = "1";
                          } else if (_quantity == "1") {
                            _quantity = "2";
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Count',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _totalCount.toString().padLeft(2, '0'),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('01', style: TextStyle(color: Colors.grey[600])),
                  Expanded(
                    child: Slider(
                      value: _totalCount.toDouble(),
                      min: 1,
                      max: 100,
                      activeColor: Colors.blue,
                      onChanged: (double value) {
                        setState(() {
                          _totalCount = value.round();
                        });
                      },
                    ),
                  ),
                  Text('100', style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Set Date',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _startDate ?? DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _startDate = pickedDate;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _startDate != null ? 'Today' : 'Start Date',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[800]),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _endDate ??
                              DateTime.now().add(const Duration(days: 30)),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _endDate = pickedDate;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _endDate != null ? 'End Date' : 'End Date',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[800]),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Frequency of Days',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _frequencyType,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: _frequencyOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _frequencyType = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('How many times a Day',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _timesPerDay,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: _timesPerDayOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _timesPerDay = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildDoseTiming(1),
              _buildDoseTiming(2),
              _buildDoseTiming(2),
              const SizedBox(height: 20),
              Row(
                children: _doseTimingOptions
                    .map((timing) => Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _doseTiming = timing;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: _doseTiming == timing
                                    ? Colors.blue[100]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                timing,
                                style: TextStyle(
                                  color: _doseTiming == timing
                                      ? Colors.blue[800]
                                      : Colors.grey[800],
                                  fontWeight: _doseTiming == timing
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _addMedicine,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoseTiming(int doseNumber) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.access_time, color: Colors.grey),
              const SizedBox(width: 10),
              Text(
                'Dose $doseNumber',
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              const Spacer(),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  void _addMedicine() {
    if (_selectedColor == null || _selectedType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    final medicineDetails = {
      'compartment': _selectedCompartment,
      'color': _selectedColor,
      'type': _selectedType,
      'quantity': _quantity,
      'totalCount': _totalCount,
      'startDate': _startDate,
      'endDate': _endDate,
      'frequency': _frequencyType,
      'timesPerDay': _timesPerDay,
      'doseTiming': _doseTiming,
    };

    print('Medicine Details: $medicineDetails');

    Navigator.pop(context, medicineDetails);
  }
}
