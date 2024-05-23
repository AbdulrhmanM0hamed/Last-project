import 'package:flutter/material.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dr. John Doe - Dermatologist'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'), // تحديد صورة الخلفية
          fit: BoxFit.cover, // تغطية الشاشة بالصورة
        )),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Doctor information section
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/image1.png'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Dr. John Doe',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Dermatologist',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      '123 Street Name, City, Country',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Services section
              Text(
                'Services Offered',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: ListTile(
                  title: Text('Skin Consultation'),
                  subtitle: Text('Consultation for skin conditions'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navigate to skin consultation details
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Acne Treatment'),
                  subtitle: Text('Treatment for acne and related issues'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navigate to acne treatment details
                  },
                ),
              ),
              // Add more services as needed
              SizedBox(height: 20),
              // Previous Cases section
              Text(
                'Previous Cases',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // Display previous cases
                  _buildPreviousCase('assets/images/case 1.jpeg', 'Case 1'),
                  _buildPreviousCase('assets/images/case 2.jpg', 'Case 2'),

                  // Add more previous cases as needed
                ],
              ),
              SizedBox(height: 20),
              // Articles and Research section
              Text(
                'Articles and Research',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text('Article Title 1'),
                subtitle: Text('Summary of the article or research'),
                onTap: () {
                  // Navigate to article details
                },
              ),
              ListTile(
                title: Text('Article Title 2'),
                subtitle: Text('Summary of the article or research'),
                onTap: () {
                  // Navigate to article details
                },
              ),
              // Add more articles and research as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreviousCase(String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        // Navigate to case details
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
