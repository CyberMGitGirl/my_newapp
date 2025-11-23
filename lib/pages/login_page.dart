import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_newapp/widgets/custom_button.dart';
import 'package:my_newapp/widgets/custom_textfield.dart';
import 'package:my_newapp/widgets/password_textfield.dart';
import 'package:my_newapp/widgets/social_signin.dart';
                                                              //NB: removed textfield below because there is a search icon. Instead having a tab...makes it possible to switch between a map view and a list view
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            Text(
              "Welcome Back",
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              "Been a while",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            CustomTextField(
              label: "Email",
              textEditingController: emailController,
            ),
            SizedBox(height: 16),
            PasswordTextfield(textEditingController: passwordController),
            SizedBox(height: 16),
            CustomButton(
              text: "Login",
              onPressed: () {
                // check email
                // if it is not valid return and show message
                // check password
                // if it is not valid return and show message
                // else take user to the next page
                if (emailController.text != "cymary@gmail.com") {                 //ao@gmail.com
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Not a valid email. Try again")),
                  );

                  return;
                }

                if (passwordController.text != "12345") {                        //2...6
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Not a valid passord. Try again")),
                  );

                  // showDialog(context: context, builder: (context){
                  //   return AlertDialog(
                  //     content: Text("Not a valid passord Try again"),
                  //     actions: [],
                  //   );
                  // });

                  return;
                }

                Navigator.of(context).pushReplacementNamed("/home");
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/forgot");
              },
              child: Text("Forgot Password?"),
            ),
            SizedBox(height: 24),

            SocialSignIn(),

            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("/signup");
                  },
                  child: Text("Sign up", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}













/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            Text(
              "Get Started",
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              "Register Your Details Below",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                labelText: "Email",                                            //Note, labelText is different from hintText
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                labelText: "Password",                                        //label differnt from hint
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 55),                                    //Use Size() for both, or specify...width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text("Login"),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: Divider()),                                 //Use Divider plus Expanded to fill up available space and show lines
                Text("Sign up with"), 
                Expanded(child: Divider()),
              ],
            ),

            // INSERTED ICONS SECTION
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebookF),
                  onPressed: () {},
                  color: Colors.blue[800],
                  iconSize: 28,
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.xTwitter),
                  onPressed: () {},
                  color: Colors.black87,
                  iconSize: 28,
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.linkedinIn),
                  onPressed: () {},
                  color: Colors.blue[700],
                  iconSize: 28,
                ),
              ],
            ),
                                                                                      //i e

            Text("Thank you for choosing MediCall !"),
            SizedBox(height: 36,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(child: Text("Sign up", style: TextStyle(color: Colors.blue),))
              ],
            )
          ],
        ),
      ),
    );
  }
} */