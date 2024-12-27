import 'package:flutter/material.dart';
import 'package:user1_bookingrepair/Repair%20Shop/booking/booking%20_details_screen.dart';

class CarRepairBookingScreen extends StatefulWidget {
  const CarRepairBookingScreen({super.key});

  @override
  _CarRepairBookingScreenState createState() => _CarRepairBookingScreenState();
}

class _CarRepairBookingScreenState extends State<CarRepairBookingScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form inputs
  final _carModelController = TextEditingController();
  final _licensePlateController = TextEditingController();
  final _issueDescriptionController = TextEditingController();

  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _landmarkController = TextEditingController();

  final _additionalNotesController = TextEditingController();

  // Issue Description Dropdown
  String? _selectedIssue;
  List<Map<String, dynamic>> issues = [
    {'name': 'Flat Tire', 'price': 500},
    {'name': 'Engine Overheating', 'price': 1000},
    {'name': 'Battery Replacement', 'price': 800},
    {'name': 'Brake Repair', 'price': 1200},
    {'name': 'Transmission Issues', 'price': 1500},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Repair Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Car Details:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _carModelController,
                  decoration: const InputDecoration(
                    labelText: 'Car Model',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the car model.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _licensePlateController,
                  decoration: const InputDecoration(
                    labelText: 'License Plate',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the license plate.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                // Issue Description Dropdown
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedIssue,
                  hint: const Text('Select Issue Description'),
                  items: issues.map((issue) {
                    return DropdownMenuItem<String>(
                      value: issue['name'],
                      child: Text('${issue['name']} - ₱${issue['price']}'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedIssue = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an issue description.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Service Location:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _streetController,
                  decoration: const InputDecoration(
                    labelText: 'Street Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the street address.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the city.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _stateController,
                  decoration: const InputDecoration(
                    labelText: 'State/Province',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the state or province.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _zipCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Zip Code',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the zip code.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _countryController,
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the country.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _landmarkController,
                  decoration: const InputDecoration(
                    labelText: 'Landmark (Optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Additional Notes (Optional):',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _additionalNotesController,
                  decoration: const InputDecoration(
                    labelText: 'Any additional details or requests?',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                // Price Display and Confirmation Buttons
                const SizedBox(height: 10),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _selectedIssue == null
                        ? const SizedBox.shrink()
                        : Text(
                            'Estimated Price: ₱${issues.firstWhere((issue) => issue['name'] == _selectedIssue)['price']}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Navigate to the BookingDetailsScreen with all the details
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingDetailsScreen(
                                carModel: _carModelController.text,
                                licensePlate: _licensePlateController.text,
                                issueDescription: _selectedIssue ?? '',
                                street: _streetController.text,
                                city: _cityController.text,
                                state: _stateController.text,
                                zipCode: _zipCodeController.text,
                                country: _countryController.text,
                                landmark: _landmarkController.text,
                                serviceProviderName: '',
                                serviceProviderProfile: '',
                                isUrgent: true,
                                issuePrice: '',
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('CONFIRM BOOKING'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF28435A),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        // Clear the form
                        _formKey.currentState!.reset();
                        _carModelController.clear();
                        _licensePlateController.clear();
                        _issueDescriptionController.clear();
                        _streetController.clear();
                        _cityController.clear();
                        _stateController.clear();
                        _zipCodeController.clear();
                        _countryController.clear();
                        _landmarkController.clear();
                        _additionalNotesController.clear();
                      },
                      child: const Text('CANCEL'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
