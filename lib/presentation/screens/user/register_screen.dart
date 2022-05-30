import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home_card.dart';
import 'package:magdsoft_flutter_structure/presentation/view/two_options_row.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custome_text_feild.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/tosts.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  final phoneController = TextEditingController();

  final nameController = TextEditingController();
  bool b1 = false;
  bool isvalid() {
    RegExp mailregex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    RegExp phoneregex = RegExp(r'^01[0125][0-9]{8}$');
    if (nameController.text.isEmpty || nameController.text.length < 3) {
      tosta.errorTosta("Enter valid name"); // name error
      b1 = false;
    } else {
      if (emailController.text.isEmpty ||
          !mailregex.hasMatch(emailController.text)) {
        tosta.errorTosta("Enter valid email"); // email error
        b1 = false;
      } else {
        if (!phoneregex.hasMatch(phoneController.text)) {
          tosta.errorTosta("Enter valid Phone number"); // phone error
          b1 = false;
        } else {
          if (passwordController.text.isEmpty ||
              passwordController.text.length < 8) {
            tosta.errorTosta(
                "password cannot be empty or\nless than 8 characters"); // password error
            b1 = false;
          } else {
            if (passwordController.text != confirmController.text) {
              tosta.errorTosta(
                  'passwords not the same'); // confirm password error
            } else {
              b1 = true;
            }
          }
        }
      }
    }
    return b1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeCard(columnChildern: [
        Expanded(
          flex: 4,
          child: loginPart1(context),
        ),
        Expanded(
          // flex: 2,
          child: TwoOptionsRow(
            isInLoginScreen: false,
            fun: isvalid,
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            password: passwordController.text,
          ),
        ),
      ]),
    );
  }

  bool showPassword = false;
  Tosts tosta = Tosts();

  Widget loginPart1(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ////////////////////////////////for name
            TextFormField(
              textAlign: TextAlign.left,
              controller: nameController,
              keyboardType: TextInputType.name,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter your email',
                hintStyle: const TextStyle(
                  color: AppColor.darkGrey,
                ),
                fillColor: AppColor.lightGrey,
                filled: true,
              ),
            ),
            /////////////////////////////////// for email
            CustomeTextFeild(
              controller: emailController,
              hintText_: 'Enter mail',
              errorMessage: "invalid email format",
            ),
            /////////////////////////////////// for phone number
            CustomeTextFeild(
              controller: phoneController,
              hintText_: 'Enter your phone number',
              errorMessage: "invalid phone number",
            ),
            /////////////////////////////////// for password

            TextFormField(
              textAlign: TextAlign.left,
              controller: passwordController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              obscureText: !showPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter your password',
                hintStyle: const TextStyle(
                  color: AppColor.darkGrey,
                ),
                fillColor: AppColor.lightGrey,
                filled: true,
                prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: showPassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                helperStyle: const TextStyle(color: Colors.redAccent),
              ),
            ),
            /////////////////////////////////// for confirm password
            TextFormField(
              textAlign: TextAlign.left,
              controller: confirmController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              obscureText: !showPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Confirm your password',
                hintStyle: const TextStyle(
                  color: AppColor.darkGrey,
                ),
                fillColor: AppColor.lightGrey,
                filled: true,
                prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: showPassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
