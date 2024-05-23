import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Notification",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        children: [
          if (arguments != null && arguments is bool && arguments)
            NotificationItem(
              title: 'Appointment Reminder',
              subtitle:
                  'Your appointment with Dr. Dermatologist is tomorrow at 10:00 AM.',
              timestamp: 'Just now',
            ),
          NotificationItem(
            title: 'New Prescription',
            subtitle:
                'Dr. Dermatologist has issued a new prescription for your treatment.',
            timestamp: '1 day ago',
          ),

          // Add more NotificationItems as needed
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timestamp;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          Text(subtitle),
          SizedBox(height: 4),
          Text(
            timestamp,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle notification item tap
      },
    );
  }
}
