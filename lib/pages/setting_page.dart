import 'package:doctor_app/Settings/general_page.dart';
import 'package:doctor_app/Settings/notify_page.dart';
import 'package:doctor_app/Settings/privacy_page.dart';
import 'package:doctor_app/Settings/profile_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 25,
            ),
            // الصورة واسم الشخص
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/profile.jpg'), // صورة الشخص
                  radius: 30, // حجم الدائرة
                ),
                SizedBox(width: 20), // مسافة بين الصورة والنص
                Text(
                  'John Doe', // اسم الشخص
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            // مسافة بين صورة الشخص والعناصر التالية
            SizedBox(height: 40),
            // عناصر القائمة
            ListTile(
              leading: Image.asset(
                  "assets/images/profile.png"), // الأيقونة على اليسار
              title: Text('Profile'), // العنوان
              trailing: Icon(Icons.arrow_forward_ios), // الأيقونة على اليمين
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Image.asset("assets/images/notification-bell.png"),
              title: Text('Notifications'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsPage()));
              },
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Image.asset("assets/images/privacy-policy.png"),
              title: Text('Privacy'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyPage()));
              },
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Image.asset("assets/images/general.png"),
              title: Text('General'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GeneralPage()));
              },
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Image.asset("assets/images/info.png"),
              title: Text('About Us'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // الإجراء عند الضغط على العنصر
              },
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Image.asset("assets/images/logout.png"),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // الإجراء عند الضغط على العنصر
              },
            ),
          ],
        ),
      ),
    );
  }
}
