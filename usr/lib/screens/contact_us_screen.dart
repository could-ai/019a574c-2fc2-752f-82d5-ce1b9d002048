import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  Future<void> _launchWhatsApp() async {
    // Replace with your WhatsApp number
    const String phoneNumber = '+923001234567';
    const String message = 'Hello DSL Courier, I need help.';
    final Uri whatsappUri = Uri.parse('https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}');
    
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      // Can't launch WhatsApp, handle error
      debugPrint("Could not launch WhatsApp");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.red[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Get in Touch',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildContactInfo(
              context,
              icon: Icons.phone,
              title: 'Phone Number',
              subtitle: '+92 300 1234567',
            ),
            _buildContactInfo(
              context,
              icon: Icons.email,
              title: 'Email Address',
              subtitle: 'info@dslcourier.com',
            ),
            _buildContactInfo(
              context,
              icon: Icons.location_on,
              title: 'Head Office',
              subtitle: 'DSL Courier Head Office, Karachi, Pakistan',
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              'Customer Support',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Have a question? Our team is here to help. Tap the button below to chat with us directly on WhatsApp.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: _launchWhatsApp,
                icon: const Icon(Icons.chat_bubble_outline),
                label: const Text('Chat on WhatsApp'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, {required IconData icon, required String title, required String subtitle}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.red[700]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
