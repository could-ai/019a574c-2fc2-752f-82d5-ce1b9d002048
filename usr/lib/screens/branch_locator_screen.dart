import 'package:flutter/material.dart';

class BranchLocatorScreen extends StatefulWidget {
  const BranchLocatorScreen({super.key});

  @override
  State<BranchLocatorScreen> createState() => _BranchLocatorScreenState();
}

class _BranchLocatorScreenState extends State<BranchLocatorScreen> {
  final List<Map<String, String>> _allBranches = [
    {'name': 'Karachi Head Office', 'address': 'Shahrah-e-Faisal, Karachi'},
    {'name': 'Lahore Main Branch', 'address': 'Gulberg III, Lahore'},
    {'name': 'Islamabad Hub', 'address': 'Blue Area, Islamabad'},
    {'name': 'Peshawar Branch', 'address': 'Saddar Road, Peshawar'},
    {'name': 'Quetta Office', 'address': 'Jinnah Road, Quetta'},
    {'name': 'Faisalabad Branch', 'address': 'D Ground, Faisalabad'},
  ];

  List<Map<String, String>> _foundBranches = [];

  @override
  void initState() {
    _foundBranches = _allBranches;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, String>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allBranches;
    } else {
      results = _allBranches
          .where((branch) =>
              branch['name']!.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              branch['address']!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundBranches = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branch Locator'),
        backgroundColor: Colors.red[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Search by city or area',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _foundBranches.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundBranches.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundBranches[index]['name']),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Icon(Icons.location_city, color: Colors.red[700]),
                          title: Text(_foundBranches[index]['name']!),
                          subtitle: Text(_foundBranches[index]['address']!),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 18),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
