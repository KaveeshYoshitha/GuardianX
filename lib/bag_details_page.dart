import 'package:flutter/material.dart';

class BagDetailsPage extends StatelessWidget {
  final String bagName;
  final String ownerName;
  final VoidCallback onRemoveBag;

  const BagDetailsPage({
    super.key,
    required this.bagName,
    required this.ownerName,
    required this.onRemoveBag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bagName),
        backgroundColor: const Color(0xFFC1E4E9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bag and Owner Details
            Text(
              'Bag: $bagName',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Owner: $ownerName',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Spacer(),

            // Remove Bag Button
            ElevatedButton(
              onPressed: onRemoveBag,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: const Text(
                'Remove',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),

            // See Location Button
            ElevatedButton(
              onPressed: () {
                // Implement location feature here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('See location button clicked')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: const Text(
                'Location',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),

            // Bag Details Button
            ElevatedButton(
              onPressed: () {
                // Implement bag details feature here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Bag details button clicked')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: const Text(
                'Details',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),

            // Connect to IoT Device Button
            ElevatedButton(
              onPressed: () {
                // Implement IoT connection feature here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('IoT connection button clicked')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: const Text(
                'Connect',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
