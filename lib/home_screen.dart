import 'package:flutter/material.dart';
import 'add_bag_popup.dart';
import 'bag_details_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> bags = []; // List to store bag details

  void addBag(String bagName, String ownerName) {
    setState(() {
      bags.add(
          {'name': bagName, 'owner': ownerName}); // Add new bag to the list
    });
  }

  void removeBag(int index) {
    setState(() {
      bags.removeAt(index); // Remove bag at the given index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC1E4E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC1E4E9),
        elevation: 0,
        leading: const CircleAvatar(
          backgroundImage: AssetImage(
              'assets/images/profile_image.png'), // Example profile image
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, User1',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Display Bag Cards if available
            Expanded(
              child: bags.isEmpty
                  ? const Center(
                      child: Text(
                        'No bags added yet.',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: bags.length,
                      itemBuilder: (context, index) {
                        final bag = bags[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          color: const Color(0xFFFFF9E6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            title: Text('Bag: ${bag['name']}'),
                            subtitle: Text("Owner: ${bag['owner']}"),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              // Navigate to BagDetailsPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BagDetailsPage(
                                    bagName: bag['name']!,
                                    ownerName: bag['owner']!,
                                    onRemoveBag: () {
                                      Navigator.pop(
                                          context); // Go back to HomeScreen
                                      removeBag(index); // Remove the bag
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
            // Add Bag Button
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddBagPopup(
                      onSave: (bagName, ownerName) {
                        addBag(bagName, ownerName); // Add bag to list
                      },
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFF9E6),
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: const Text(
                'Add Bag',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
