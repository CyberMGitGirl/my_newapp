import 'package:flutter/material.dart';
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
}









/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              "Register your details below",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                labelText: "Password",                                    //label differnt from hint
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 55),                                   //Use Size() for both, or specify...width and height
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
              spacing: 8,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: Divider()), 
                Text("Sign up with"), 
                Expanded(child: Divider()),
              ],
            ),
            Text("..."),
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
}

*/