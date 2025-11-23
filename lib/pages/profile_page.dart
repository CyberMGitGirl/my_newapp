import 'package:my_newapp/pages/notifications_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_newapp/pages/model/user_detail.dart';
import 'package:my_newapp/pages/provider/user_notifier.dart';
import 'package:my_newapp/pages/editing/editing_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserNotifier>(context);
    UserDetail? user = userProvider.loggedInUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProfilePics(user),
          _buildDetails(user),
          SizedBox(height: 16),
          _buildAccountSection(),
          SizedBox(height: 16),
          _buildSupportSection(),
          SizedBox(height: 56),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade100,
              foregroundColor: Colors.red.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              userProvider.logout();
              Navigator.pushReplacementNamed(context, "/login");
            },
            icon: Icon(Icons.logout),
            label: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Column _buildSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Support",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ListTile(
          title: Text("About us", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
        Divider(),
        ListTile(
          title: Text("Contact us", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
      ],
    );
  }

  Column _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => EditingProfilePage(),
              ),
            );
          },
          title: Text("Personal Information", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
        Divider(),
        ListTile(
          title: Text("Payment Methods", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NotificationsPage(),
              ),
            );
          },
          title: Text("Notifications", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
      ],
    );
  }

  Widget _buildProfilePics(UserDetail? user) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: user == null || user.profilePicture.isEmpty
          ? Image.asset(
              "assets/aiony-haust-3TLl_97HNJo-unsplash.jpg",                       
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
          : Image.asset(
              user.profilePicture,                                        // if I need to store asset paths in user.profilePicture
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _buildDetails(UserDetail? user) {
    if (user == null) return Text("User Details not set");

    return Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        Text(
          user.email,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
        ),
      ],
    );
  }
}



/*
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProfilePics(),
          _buildDetails(),
          SizedBox(height: 16),

          _buildAccountSection(),
          SizedBox(height: 16),

          _buildSupportSection(),
          SizedBox(height: 56),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade100,
              foregroundColor: Colors.red.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              userProvider.logout();

              Navigator.pushReplacementNamed(context, "/login");
            },
            icon: Icon(Icons.logout),
            label: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Column _buildSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Support",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ListTile(
          title: Text("About us", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
        Divider(),
        ListTile(
          title: Text("Contact us", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
      ],
    );
  }

  Column _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ListTile(
          onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => EditingProfilePage(),
            ),
          );
        },

          title: Text("Personal Information", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
        Divider(),
        ListTile(
          title: Text("Payment Methods", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NotificationsPage();
                },
              ),
            );
          },
          title: Text("Notifications", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
      ],
    );
  }

  Widget _buildProfilePics() {
    UserDetail? user = Provider.of<UserNotifier>(context).loggedInUser;

    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: user!.profilePicture.isEmpty                                 //This means if its empty (ie user hasn't uploaded any show an icon.
          ? Icon(Icons.person_2, size: 100)
          : Image.network(user!.profilePicture, width: 100, height: 100),  //child: Image.network("assets/lady smiling brunette profile picture.jpg", width: 100, height: 100),   //changed from Image.asset... due to firestore level from userNotifier page connection
    );
  }

  Widget _buildDetails() {
    UserDetail? user = Provider.of<UserNotifier>(context).loggedInUser;

    if (user == null) return Text("User Details not set");

    return Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        Text(
          user.email,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
        ),
      ],
    );
  }
}
*/



/*

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProfilePics(),
          _buildDetails(),
          SizedBox(height: 16),

          _buildAccountSection(),
          SizedBox(height: 16),

          _buildSupportSection(),
          SizedBox(height: 56),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade100,
              foregroundColor: Colors.red.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
            ),
            onPressed: () {},
            icon: Icon(Icons.logout),
            label: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Column _buildSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Support",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ListTile(
          title: Text("About us", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
        Divider(),
        ListTile(
          title: Text("Contact us", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
      ],
    );
  }

  Column _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ListTile(
          title: Text("Personal Information", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
        Divider(),
        ListTile(
          title: Text("Payment Methods", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                return NotificationsPage();
              })
            );
          },
          title: Text("Notifications", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
      ],
    );
  }

  Widget _buildProfilePics() {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: Image.network("assets/lady smiling brunette profile picture.jpg", width: 100, height: 100),   //changed from Image.asset... due to firestore level from userNotifier page connection
    );
  }

  Widget _buildDetails() {
    return Column(
      children: [
        Text(
          "Hannah Michael",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        Text(
          "hannahmail@gnail.com",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
        ),
      ],
    );
  }
}

*/