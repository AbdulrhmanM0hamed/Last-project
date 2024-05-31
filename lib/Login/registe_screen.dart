import 'package:doctor_app/Common%20Widgets/TextField.dart';
import 'package:doctor_app/Common%20Widgets/button_style.dart';
import 'package:doctor_app/Common/Color_extentions.dart';
import 'package:doctor_app/Login/login_screen.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:doctor_app/pages/home_page%20copy.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _imageFile;

  final picker = ImagePicker();

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 140,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.asset("assets/images/logo.jpeg"),
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    S.of(context).sign_up,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: TColor.primaryText,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 210,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 36, 139, 208),
                      borderRadius: BorderRadius.circular(20),
                      image: _imageFile != null
                          ? DecorationImage(
                              image: FileImage(_imageFile!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _imageFile == null
                        ? GestureDetector(
                            onTap: _getImageFromGallery,
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white,
                            ),
                          )
                        : null,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFieldWidget(
                    Labeltext: S.of(context).Username,
                    ispass: false,
                  ),
                  TextFieldWidget(
                    Labeltext: S.of(context).email,
                    ispass: false,
                  ),
                  TextFieldWidget(
                    Labeltext: S.of(context).Phone,
                    ispass: false,
                  ),
                  TextFieldWidget(
                    Labeltext: S.of(context).Password,
                    ispass: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button_Style(
                      title: S.of(context).sign_up,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
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
                          onPressed: () {
                            // Perform action on Apple sign-in
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/images/logoFace.png',
                            height: 50,
                            width: 50,
                          ),
                          onPressed: () {
                            // Perform action on Facebook sign-in
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/images/logoGoogle.png',
                            height: 50,
                            width: 50,
                          ),
                          onPressed: () {
                            // Perform action on Google sign-in
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).do_you_have_an_account),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          S.of(context).sign_in,
                          style: TextStyle(color: TColor.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
