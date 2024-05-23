import 'package:doctor_app/data/json.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/main.dart';
import 'package:doctor_app/pages/doctor_profile_page.dart';
import 'package:doctor_app/widgets/GetBestMedicalService.dart';
import 'package:doctor_app/widgets/Search_medical.dart';
import 'package:doctor_app/widgets/User_Info.dart';
import 'package:doctor_app/widgets/popular_doctor.dart';
import 'package:doctor_app/widgets/size_config.dart';
import 'package:doctor_app/widgets/upcomingAppointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/data.dart';

class HomePage_F extends StatefulWidget {
  const HomePage_F({super.key});

  @override
  State<HomePage_F> createState() => _HomePage_FState();
}

class _HomePage_FState extends State<HomePage_F> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 7,
              ),
              child: Column(
                children: const [
                  // User Info Area .
                  UserInfo(),
                  // SearchMedical Area.
                  SearchMedical(),
                  // Services Area .
                  Services(),
                  // GetBestMedicalService
                  GetBestMedicalService(),
                ],
              ),
            ),

            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: isArabic() ? 0 : 40, right: isArabic() ? 40 : 0),
                child: Text(
                  S.of(context).popular_Doctor,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
            // Upcoming Appointments
            GestureDetector(
              onTap: () {
                // Handle the onTap event
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                        doctors.length < 3 ? doctors.length : 3, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorProfilePage(
                                doctor: doctors[index],
                                doctorimage: doctors[index],
                              ),
                            ),
                          );
                        },
                        child: PopularDoctor(
                          doctor: doctors[index],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Services extends StatelessWidget {
  const Services({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: isArabic() ? 0 : 16, right: isArabic() ? 16 : 0),
          child: Text(
            S.of(context).service,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: servicesList(context)
              .map(
                (e) => CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => e.content(context)),
                      );
                    },
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal! * 17,
                      height: SizeConfig.blockSizeHorizontal! * 17,
                      decoration: BoxDecoration(
                        color: e.color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(e.image),
                            Text(
                              e.title,
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
