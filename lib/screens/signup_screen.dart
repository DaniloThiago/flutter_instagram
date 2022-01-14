import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
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
            Flexible(
              child: Container(),
              flex: 2,
            ),
            // SVG Logo
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(height: 24),
            // Circular widget to accept and show our selected file
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/7073492?v=4'),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo),
                  ),
                  bottom: -10,
                  left: 80,
                )
              ],
            ),
            const SizedBox(height: 24),
            // Text field for username
            TextFielInput(
              hintText: 'Enter your name',
              textInputType: TextInputType.text,
              textEditingController: _usernameController,
            ),
            const SizedBox(height: 24),
            // Text field for bio
            TextFielInput(
              hintText: 'Enter your bio',
              textInputType: TextInputType.text,
              textEditingController: _bioController,
            ),
            const SizedBox(height: 24),
            // Text field for email
            TextFielInput(
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            const SizedBox(
              height: 24,
            ),
            // Text field for password
            TextFielInput(
              hintText: 'Enter your password',
              textInputType: TextInputType.emailAddress,
              textEditingController: _passwordController,
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            // Button Login
            InkWell(
              onTap: () async {
                await AuthMethods().signUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                  bio: _bioController.text,
                );
              },
              child: Container(
                child: const Text('Sign up'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    color: blueColor),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            // Signing up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text(
                    'Don\'t have account?',
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
