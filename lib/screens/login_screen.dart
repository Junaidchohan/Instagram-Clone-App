import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/widgets/text_feild_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),
              Flexible(flex: 2, child: Container()),
              SizedBox(height: 64),
              TextFeildInput(
                controller: TextEditingController(),
                textEditingController: _emailController,
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24),
              TextFeildInput(
                controller: TextEditingController(),
                textEditingController: _passwordController,
                hintText: "Enter your password",
                isPass: true,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 24),
              InkWell(
                child: Container(
                  child: Text("Log in"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Flexible(flex: 2, child: Container()),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text("Don't have an account?"),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
