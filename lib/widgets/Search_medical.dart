import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/style/app_style.dart';
import 'package:doctor_app/widgets/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchMedical extends StatelessWidget {
  const SearchMedical({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical! * 3),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          prefixIcon: CupertinoButton(
            onPressed: () {},
            child: SvgPicture.asset(AppStyle.searchIcon),
          ),
          suffixIcon: CupertinoButton(
            onPressed: () {},
            child: SvgPicture.asset(AppStyle.filtterIcon),
          ),
          hintText: S.of(context).search_medical,
          fillColor: AppStyle.inputFillColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
