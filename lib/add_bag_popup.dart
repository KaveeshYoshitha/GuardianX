import 'package:flutter/material.dart';

class AddBagPopup extends StatelessWidget {
  final TextEditingController bagNameController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();

  final Function(String bagName, String ownerName) onSave;

  AddBagPopup({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: const Text(
        'Add New Bag',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bag Name Field
          TextField(
            controller: bagNameController,
            decoration: const InputDecoration(
              labelText: 'Name of the Bag',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          // Owner's Name Field
          TextField(
            controller: ownerNameController,
            decoration: const InputDecoration(
              labelText: "Owner's Name",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        // Cancel Button
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the popup
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
        ),
        // Save Button
        ElevatedButton(
          onPressed: () {
            String bagName = bagNameController.text.trim();
            String ownerName = ownerNameController.text.trim();

            if (bagName.isNotEmpty && ownerName.isNotEmpty) {
              onSave(bagName, ownerName); // Pass data back to the home page
              Navigator.pop(context); // Close the popup
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please fill in all fields'),
                ),
              );
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
