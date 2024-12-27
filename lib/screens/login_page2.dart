import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nimbus/screens/home_page.dart';

import '../widgets/mobile_number_field_button.dart';
import '../widgets/primary_button.dart';
import '../widgets/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset('lib/assets/animations/trophy_animation.json',
                height: 250, width: 250),
            const Text(
              "Login / Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const EmailFields(
              controller: null,
              hintText: 'Enter Email',
              obscureText: false,
            ),
            const EmailFields(
              controller: null,
              hintText: 'Enter Password',
              obscureText: true,
            ),
            PrimaryButton(
                text: "Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }),
            const SizedBox(
              height: 32,
            ),
            const Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Color(0xFF858585),
                    thickness: 2,
                    indent: 100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'OR',
                    style: TextStyle(
                      color: Color(0xFF858585),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color(0xFF858585),
                    thickness: 2,
                    endIndent: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // google button
                SquareTile(
                    imagePath:
                        'https://e7.pngegg.com/pngimages/704/688/png-clipart-google-google.png'),

                SizedBox(width: 32),

                // apple button
                SquareTile(
                    imagePath:
                        'https://i.pinimg.com/736x/5b/83/69/5b83693bae2828e7c357855f276520b0.jpg')
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                    text: 'By continuing, you agree to the ',
                    style: TextStyle(color: Color(0xFF969696)),
                  ),
                  TextSpan(
                    text: 'Terms of Services',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: ' & ',
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: '.',
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
