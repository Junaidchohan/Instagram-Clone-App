import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone_app/resources/auth_methods.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/utils/utils.dart';
import 'package:instagram_clone_app/widgets/text_feild_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  final AuthMethods _authMethods = AuthMethods();

  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> selectImage() async {
    final Uint8List? im = await pickImage(ImageSource.gallery);
    if (im == null) return;

    setState(() {
      _image = im;
    });
  }

  Future<void> signUpUser() async {
    if (_image == null) {
      showSnackBar("Please select a profile image", context);
      return;
    }

    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _userController.text.isEmpty ||
        _bioController.text.isEmpty) {
      showSnackBar("Please fill all fields", context);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final String res = await _authMethods.signUpUser(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      username: _userController.text.trim(),
      bio: _bioController.text.trim(),
      file: _image!,
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      // navigate to home later
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Flexible(flex: 2, child: SizedBox()),
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: _image != null
                        ? MemoryImage(_image!)
                        : const NetworkImage("https://i.imgur.com/BoN9kdC.png")
                              as ImageProvider,
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 64),

              TextFeildInput(
                textEditingController: _userController,
                hintText: "Enter your username",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),

              TextFeildInput(
                textEditingController: _emailController,
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),

              TextFeildInput(
                textEditingController: _passwordController,
                hintText: "Enter your password",
                isPass: true,
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),

              TextFeildInput(
                textEditingController: _bioController,
                hintText: "Enter your bio",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),

              InkWell(
                onTap: _isLoading ? null : signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Sign Up"),
                ),
              ),

              const SizedBox(height: 12),
              const Flexible(flex: 2, child: SizedBox()),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Log In",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
