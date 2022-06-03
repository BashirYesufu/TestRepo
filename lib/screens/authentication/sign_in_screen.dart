import 'package:apex/components/apex_button.dart';
import 'package:apex/components/apex_scaffold.dart';
import 'package:apex/components/apex_textfield.dart';
import 'package:apex/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../components/apex_icon_button.dart';
import '../../components/screen_title.dart';
import '../../constants/text_styles.dart';
import '../../utilities/provider/providers/loading_provider.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);
  static const screenID = "SignIn";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTC = TextEditingController();
  final TextEditingController _passwordTC = TextEditingController();

  bool hasText = false;

  @override
  Widget build(BuildContext context) {
    final loader = Provider.of<LoadingStateProvider>(context);
    return ApexScaffold(hasBackButton: true, children: [
      ScreenTitle(
        title: 'Hi There! 👋 ',
        subTitle: 'Welcome back, Sign in to your account',
      ),
      ApexTextField(
        hintText: 'Email',
        controller: _emailTC,
        onChanged: (value) {
          checkButton();
        },
      ),
      ApexTextField(
        hintText: 'Password',
        obscureText: true,
        controller: _passwordTC,
        onChanged: (value) {
          checkButton();
        },
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                //TODO: Navigate to forgot password screen
                print(hasText);
              },
              child: Text(
                'Forgot Password?',
                style: ApexTextStyles.kOrange16,
              ),
            ),
            Spacer()
          ],
        ),
      ),
      ApexButton(
        onPressed: () {
          //TODO: Login User
          loader.load();
        },
        text: 'Sign In',
        enabled: hasText,
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            Flexible(
              child: Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ApexColors.white,
                      ApexColors.grey
                    ]
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text('OR', style: ApexTextStyles.kDarkGrey16,),
            ),
            Flexible(
              child: Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        ApexColors.grey,
                        ApexColors.white,
                      ]
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Row(
        children: [
          ApexIconButton(
            child: FaIcon(FontAwesomeIcons.google, size: 30,),
          ),
          SizedBox(width: 20,),
          ApexIconButton(
            child: FaIcon(FontAwesomeIcons.apple, size: 30,),
          ),
        ],
      )
    ]);
  }

  checkButton() {
    setState(() {
      if (_emailTC.text.isNotEmpty && _passwordTC.text.isNotEmpty) {
        hasText = true;
      } else {
        hasText = false;
      }
    });
  }
}