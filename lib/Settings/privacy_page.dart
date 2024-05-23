import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod orci vel diam luctus, sed pulvinar diam ornare. Nunc ut elementum lectus. Nullam tincidunt orci a vulputate vestibulum. Aliquam erat volutpat. Nam auctor, turpis ac dapibus dignissim, ipsum augue faucibus felis, vitae tempus ligula nibh vel nisi. Sed vitae metus eget risus elementum fringilla. In hac habitasse platea dictumst. Proin in libero consectetur, sodales ligula id, commodo nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data Collection',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod orci vel diam luctus, sed pulvinar diam ornare. Nunc ut elementum lectus. Nullam tincidunt orci a vulputate vestibulum. Aliquam erat volutpat. Nam auctor, turpis ac dapibus dignissim, ipsum augue faucibus felis, vitae tempus ligula nibh vel nisi. Sed vitae metus eget risus elementum fringilla. In hac habitasse platea dictumst. Proin in libero consectetur, sodales ligula id, commodo nisi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            // Add more sections as needed
          ],
        ),
      ),
    );
  }
}
