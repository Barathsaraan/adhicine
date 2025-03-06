import 'package:flutter/material.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  _AddMedicineScreenState createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  // Compartment selection
  int _selectedCompartment = 1;

  // Color selection
  final List<Color> _colorOptions = [
    const Color(0xFFFFC0CB), // Pink
    const Color(0xFFD8BFD8), // Lavender
    const Color(0xFFFFA07A), // Salmon
    const Color(0xFF90EE90), // Light Green
    const Color(0xFFFFA500), // Orange
    const Color(0xFF87CEEB), // Sky Blue
  ];
  Color? _selectedColor;

  // Medicine type selection
  final List<String> _medicineTypes = ['Tablet', 'Capsule', 'Cream'];
  String? _selectedType;

  // Quantity selection
  double _quantity = 0.5;
  int _totalCount = 1;

  // Date selection
  DateTime? _startDate;
  DateTime? _endDate;

  // Frequency selection
  String _frequencyType = 'Everyday';
  final List<String> _frequencyOptions = ['Everyday', 'Once in 2 Days'];

  // Times per day selection
  int _timesPerDay = 3;
  final List<int> _timesPerDayOptions = [1, 2, 3];

  // Dose timing selection
  String _doseTiming = 'Before Food';
  final List<String> _doseTimingOptions = [
    'Before Food',
    'After Food',
    'Before Sleep'
  ];

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Compartment Selection
              const Text('Compartment',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      6,
                      (index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ChoiceChip(
                              label: Text('${index + 1}'),
                              selected: _selectedCompartment == index + 1,
                              onSelected: (bool selected) {
                                setState(() {
                                  _selectedCompartment = index + 1;
                                });
                              },
                            ),
                          )),
                ),
              ),

              // Color Selection
              const SizedBox(height: 16),
              const Text('Colour',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _colorOptions
                      .map((color) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = color;
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: _selectedColor == color
                                      ? Border.all(
                                          color: Colors.black, width: 2)
                                      : null,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),

              // Medicine Type Selection
              const SizedBox(height: 16),
              const Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _medicineTypes
                      .map((type) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ChoiceChip(
                              label: Text(type),
                              selected: _selectedType == type,
                              onSelected: (bool selected) {
                                setState(() {
                                  _selectedType = type;
                                });
                              },
                            ),
                          ))
                      .toList(),
                ),
              ),

              // Quantity Selection
              const SizedBox(height: 16),
              const Text('Quantity',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  const Text('Take'),
                  const SizedBox(width: 8),
                  DropdownButton<double>(
                    value: _quantity,
                    // hint: Text('Quantity'),
                    icon: const Icon(Icons.arrow_drop_down),
                    items: const [],
                    // items: [0.5, 1, 2].map((double value) {
                    //   return DropdownMenuItem<double>(
                    //     value: value,
                    //     child: Text(value.toString()),
                    //   );
                    // }).toList(),
                    onChanged: (double? newValue) {
                      setState(() {
                        _quantity = newValue!;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text('Pill'),
                ],
              ),

              // Total Count Slider
              const SizedBox(height: 16),
              const Text('Total Count',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Slider(
                value: _totalCount.toDouble(),
                min: 1,
                max: 100,
                divisions: 99,
                label: _totalCount.toString(),
                onChanged: (double value) {
                  setState(() {
                    _totalCount = value.round();
                  });
                },
              ),

              // Date Selection
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Set Date',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () async {
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
                    child: Text(_startDate != null
                        ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
                        : 'Select Date'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _endDate ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _endDate = pickedDate;
                        });
                      }
                    },
                    child: Text(_endDate != null
                        ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
                        : 'End Date'),
                  ),
                ],
              ),

              // Frequency Selection
              const SizedBox(height: 16),
              const Text('Frequency of Days',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: _frequencyType,
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

              // Times per Day Selection
              const SizedBox(height: 16),
              const Text('How many times a Day',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton<int>(
                value: _timesPerDay,
                items: _timesPerDayOptions.map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _timesPerDay = newValue!;
                  });
                },
              ),

              // Dose Timing Selection
              const SizedBox(height: 16),
              const Text('Dose Timing',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: _doseTimingOptions
                    .map((timing) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ChoiceChip(
                            label: Text(timing),
                            selected: _doseTiming == timing,
                            onSelected: (bool selected) {
                              setState(() {
                                _doseTiming = timing;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),

              // Add Button
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _addMedicine,
                  child: const Text('Add Medicine'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addMedicine() {
    // Validate all required fields are filled
    if (_selectedColor == null || _selectedType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    // Create medicine object or send to database
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

    // Here you would typically save to a database or state management system
    print('Medicine Details: $medicineDetails');

    // Optionally navigate back or show a confirmation
    Navigator.pop(context, medicineDetails);
  }
}
