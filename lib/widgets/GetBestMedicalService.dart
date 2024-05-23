import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/main.dart';
import 'package:doctor_app/style/app_style.dart';
import 'package:doctor_app/widgets/size_config.dart';
import 'package:flutter/material.dart';

class GetBestMedicalService extends StatelessWidget {
  const GetBestMedicalService({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical! * 3),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffDCEDF9),
              borderRadius: BorderRadius.all(Radius.circular(28.0)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal! * 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: isArabic() ? 0 : 16,
                              right: isArabic() ? 16 : 0),
                          child: Text(
                            S.of(context).title_of_get_theBest,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1),
                        Padding(
                          padding: EdgeInsets.only(
                              left: isArabic() ? 0 : 16,
                              right: isArabic() ? 16 : 0),
                          child: Text(
                            S.of(context).discreption_of_get_theBest,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0,
                                  height: 1.5,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 2),
                    child: Image.asset(AppStyle.image1),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
