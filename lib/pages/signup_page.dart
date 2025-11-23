import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_newapp/pages/provider/user_notifier.dart';

import 'package:my_newapp/widgets/custom_button.dart';
import 'package:my_newapp/widgets/custom_textfield.dart';
import 'package:my_newapp/widgets/password_textfield.dart';
import 'package:my_newapp/widgets/social_signin.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            SizedBox(height: 100),
            Text(
              "Get Started",
              textAlign: TextAlign.center,
              style: GoogleFonts.play(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              "Create an account to continue",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            CustomTextField(
              label: "Username",
              textEditingController: nameController,
            ),
            CustomTextField(
              label: "Email",
              textEditingController: emailController,
            ),
            PasswordTextfield(textEditingController: passwordController),
            PasswordTextfield(
              textEditingController: confirmPasswordController,
              label: "Confirm Password",
            ),
            CustomButton(
              text: 'Sign up',
              onPressed: () {
                Provider.of<UserNotifier>(context).signUp(
                  //context: context,                                                    // add only of context is also in specified in UserNotifier
                  userName: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );

                //Navigator.of(context).pushReplacementNamed("/home");
              },
            ),
            SocialSignIn(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                  child: Text("Login", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


/*class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            const SizedBox(height: 100),
            Text(
              "Get Started",
              textAlign: TextAlign.center,
              style: GoogleFonts.play(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              "Create an account to continue",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            CustomTextField(label: "Username"),
            CustomTextField(label: "Email"),
            PasswordTextfield(),
            PasswordTextfield(),
            CustomButton(
              text: 'Sign up',
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/home");
              },
            ),

            const SizedBox(height: 24),

            // Divider and label
            Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Sign up with",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 Social Media Icons Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Facebook
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.facebookF),
                  onPressed: () {
                    debugPrint("Facebook sign up pressed");
                  },
                  color: Colors.blueAccent,
                  iconSize: 28,
                ),

                const SizedBox(width: 20),

                // LinkedIn
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedinIn),
                  onPressed: () {
                    debugPrint("LinkedIn sign up pressed");
                  },
                  color: Colors.blue.shade700,
                  iconSize: 28,
                ),

                const SizedBox(width: 20),

                // Google (multicolor)
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.google),
                  onPressed: () {
                    debugPrint("Google sign up pressed");
                  },
                  color: Colors.redAccent,
                  iconSize: 28,
                ),
              ],
            ),

            const SizedBox(height: 36),

            // Existing bottom text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} */