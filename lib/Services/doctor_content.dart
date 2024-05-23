import 'package:flutter/material.dart';

class DoctorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // للانتقال إلى الشاشة السابقة عند النقر على أيقونة العودة
                  },
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Services",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          ServiceTile(
            title: 'Dermatology',
            icon: Icons.local_hospital, // أيقونة لخدمة طب الجلدية
            description:
                "Dermatology is the medical specialty focused on diagnosing and treating conditions related to the skin, hair, nails, and mucous membranes. Dermatologists are trained to address a wide range of issues, from common skin conditions like acne and eczema to more serious concerns such as skin cancer. Additionally, dermatologists offer cosmetic procedures to enhance the appearance of the skin. Overall, dermatology encompasses medical and aesthetic care aimed at promoting skin health and addressing various dermatological concerns.",
          ),
          ServiceTile(
            title: 'Cosmetic Procedures',
            icon: Icons.face, // أيقونة للإجراءات التجميلية
            description:
                "Cosmetic procedures refer to non-surgical treatments performed by dermatologists to enhance the appearance of the skin, hair, or nails. These procedures aim to address concerns such as wrinkles, fine lines, volume loss, pigmentation irregularities, and hair loss. Common cosmetic procedures include Botox injections, dermal fillers, chemical peels, laser hair removal, microdermabrasion, laser skin resurfacing, and hair restoration treatments. They are elective and typically sought out to improve self-confidence and achieve aesthetic goals.",
          ),
          ServiceTile(
            title: 'Skin Cancer Screening',
            icon: Icons.favorite_border, // أيقونة لفحص سرطان الجلد
            description:
                "Skin cancer screening is a preventive health measure that involves the examination of the skin for suspicious growths or lesions that could indicate skin cancer. During the screening, a dermatologist or healthcare provider examines the skin for any abnormalities, such as moles, freckles, or spots, that may be indicative of skin cancer. Early detection through regular screenings can lead to timely treatment and improved outcomes for individuals at risk of developing skin cancer.",
          ),
          ServiceTile(
            title: 'Acne Treatment',
            icon: Icons.ac_unit, // أيقونة لعلاج حب الشباب
            description:
                "Acne treatment involves various methods aimed at reducing or eliminating acne breakouts, including topical creams, oral medications, and procedures like chemical peels or laser therapy. The goal is to reduce inflammation, unclog pores, and prevent new acne formation. Treatment plans may vary based on the severity of the acne and individual skin type, with the aim of achieving clearer, healthier skin.",
          ),
          ServiceTile(
            title: 'Hair Loss Treatment',
            icon: Icons.female,
            description:
                "Hair loss treatment involves various medical and surgical interventions aimed at addressing hair loss or alopecia. Dermatologists offer treatments such as topical medications, oral supplements, PRP therapy, and hair transplantation to help restore hair growth and improve hair density. The choice of treatment depends on the underlying cause of hair loss and the individual's preferences and medical history.",
          ),
          ServiceTile(
            title: 'Allergy Testing',
            icon: Icons.health_and_safety,
            description:
                "Allergy testing is a diagnostic procedure performed to identify allergens that trigger allergic reactions in individuals. Dermatologists use various methods such as skin prick tests, patch tests, and blood tests to determine specific allergens causing skin allergies or dermatitis. Once identified, allergens can be avoided or managed through lifestyle modifications and medical treatments.",
          ),
          ServiceTile(
            title: 'Psoriasis Treatment',
            icon: Icons.favorite,
            description:
                "Psoriasis treatment involves managing the chronic autoimmune condition characterized by red, scaly patches on the skin. Dermatologists offer treatments such as topical corticosteroids, phototherapy, oral medications, and biologic agents to reduce inflammation, alleviate symptoms, and improve the quality of life for individuals with psoriasis. Treatment plans are tailored to each patient's needs and may involve combination therapies for optimal results.",
          ),

          // يمكنك إضافة المزيد من الخدمات هنا بنفس الطريقة
        ],
      ),
    );
  }
}

// عنصر لعرض كل خدمة
class ServiceTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;

  ServiceTile(
      {required this.title, required this.icon, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ExpansionTile(
        leading: Icon(
          icon,
          color: Colors.lightBlue[200], // لون الأزرق الفاتح للأيقونة
          size: 36.0,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}
