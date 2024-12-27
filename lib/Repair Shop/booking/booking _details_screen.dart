import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  final String carModel;
  final String licensePlate;
  final String issueDescription;
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String landmark;
  final String serviceProviderName;
  final String serviceProviderProfile;
  final bool isUrgent;
  final String issuePrice;

  const BookingDetailsScreen({
    super.key,
    required this.carModel,
    required this.licensePlate,
    required this.issueDescription,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.landmark,
    required this.serviceProviderName,
    required this.serviceProviderProfile,
    required this.isUrgent,
    required this.issuePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Summary'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Car Details Header
              Text(
                'Car Details',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              // Car Details Card
              Card(
                elevation: 5.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(carModel,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('Car Model'),
                      ),
                      ListTile(
                        title: Text(licensePlate,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('License Plate'),
                      ),
                    ],
                  ),
                ),
              ),
              // Issue Description & Price Header
              Text(
                'Issue Details',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              // Issue Description & Price Card
              Card(
                elevation: 5.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(issueDescription,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('Issue Description'),
                      ),
                      ListTile(
                        title: Text(issuePrice,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('Service Price'),
                      ),
                    ],
                  ),
                ),
              ),
              // Service Location Header
              Text(
                'Service Location',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              // Service Location Card
              Card(
                elevation: 5.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(street,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('Street Address'),
                      ),
                      ListTile(
                        title: Text(city,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('City'),
                      ),
                      ListTile(
                        title: Text(state,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('State/Province'),
                      ),
                      ListTile(
                        title: Text(zipCode,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('Zip Code'),
                      ),
                      ListTile(
                        title: Text(country,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('Country'),
                      ),
                      ListTile(
                        title: Text(landmark.isEmpty ? 'N/A' : landmark,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('Landmark'),
                      ),
                    ],
                  ),
                ),
              ),
              // Service Provider Header
              Text(
                'Service Provider',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              // Service Provider Card
              Card(
                elevation: 5.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(serviceProviderName,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('Provider Name'),
                      ),
                      ListTile(
                        title: Text(serviceProviderProfile,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('Profile'),
                      ),
                    ],
                  ),
                ),
              ),
              // Urgency Header
              Text(
                'Urgency Level',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              // Urgency Card
              Card(
                elevation: 5.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(isUrgent ? 'Urgent' : 'Normal',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        subtitle: const Text('Urgency'),
                        tileColor: isUrgent
                            ? Colors.redAccent.withOpacity(0.1)
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your action for final confirmation or navigation.
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Confirm Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on TextTheme {
  get headline6 => null;
}
