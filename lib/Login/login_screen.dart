import 'package:doctor_app/Common%20Widgets/TextField.dart';
import 'package:doctor_app/Common%20Widgets/button_style.dart';
import 'package:doctor_app/Common/Color_extentions.dart';
import 'package:doctor_app/Login/registe_screen.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        "assets/images/logo.jpeg",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "DERMA",
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800),
                        ),
                        Text("  AI DX",
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.black,
                                fontWeight: FontWeight.w800))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      S.of(context).sign_in,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: TColor.primaryText,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      Labeltext: S.of(context).email,
                      ispass: false,
                    ),
                    SizedBox(height: 2),
                    TextFieldWidget(
                      Labeltext: S.of(context).Password,
                      ispass: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Button_Style(
                        title: S.of(context).sign_in,
                        onpressed: () {},
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          S.of(context).ForgerPassword,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    SizedBox(height: 40),
                    Text(
                      S.of(context).sign_in_with,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: TColor.primaryText,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset(
                              'assets/images/logoApple.png',
                              height: 50,
                              width: 50,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset(
                              'assets/images/logoFace.png',
                              height: 50,
                              width: 50,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(height: 20),
                          IconButton(
                            icon: Image.asset(
                              'assets/images/logoGoogle.png',
                              height: 50,
                              width: 50,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).Dont_have_an_account),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                              );
                            },
                            child: Text(
                              S.of(context).sign_up,
                              style: TextStyle(color: TColor.primary),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
