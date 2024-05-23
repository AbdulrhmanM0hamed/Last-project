import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/main.dart';
import 'package:doctor_app/style/app_style.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: EdgeInsets.only(
            bottom: 7, left: isArabic() ? 0 : 16, right: isArabic() ? 16 : 0),
        child: Text(S.of(context).hello),
      ),
      subtitle: Text(
        "Shahin Alam",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w700),
      ),
      trailing: Container(
        width: 48.0,
        height: 48.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStyle.profile),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 18.0,
              height: 18.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppStyle.primarySwatch,
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
