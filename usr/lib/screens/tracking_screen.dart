import 'package:flutter/material.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final TextEditingController _trackingController = TextEditingController();
  String? _trackingStatus;
  bool _isLoading = false;

  void _trackPackage() {
    if (_trackingController.text.isEmpty) {
      setState(() {
        _trackingStatus = 'Please enter a tracking number.';
      });
      return;
    }
    setState(() {
      _isLoading = true;
      _trackingStatus = null;
    });

    // Demo tracking logic
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        _trackingStatus =
            'Package #${_trackingController.text}:\n\nStatus: In Transit\nLocation: Lahore Distribution Center\nExpected Delivery: 2-3 business days.';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Your Parcel'),
        backgroundColor: Colors.red[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Enter your tracking number below to see the current status of your shipment.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _trackingController,
              decoration: InputDecoration(
                labelText: 'Tracking Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _trackPackage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Track Parcel', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 30),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_trackingStatus != null)
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _trackingStatus!,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
