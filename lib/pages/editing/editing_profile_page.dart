import 'package:flutter/material.dart';

class EditingProfilePage extends StatefulWidget {
  const EditingProfilePage({super.key});

  @override
  State<EditingProfilePage> createState() => _EditingProfilePageState();
}

class _EditingProfilePageState extends State<EditingProfilePage> {
                                                                               //text fields need controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
                                                                              //Profile picture section
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/deepsetdefaultprofile.jpg"),
                        
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                                                                        //lgc can be here
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),

            // Name field
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),

            // Email field
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16),

            // Password field
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 16),

            // Confirm Password field
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            SizedBox(height: 32),

            // Save button
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                                                                            //Implement save functionality
                },
                child: Text(
                  "Save Changes",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
