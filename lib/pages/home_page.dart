import 'package:flutter/material.dart';
import 'package:my_newapp/widgets/contact_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediCall"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          ),
        ],
        leading: Icon(Icons.menu),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: "Map"),
                Tab(text: "List"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Widget for showing map image
                  _buildMapView(),
                  //Widget for list view
                  _buildListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView(
      children: [
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
      ],
    );
  }

  Widget _buildMapView() {
    return ListView(
      children: [
        Image.asset(
          "assets/mapblur.jpg",
          width: MediaQuery.sizeOf(context).width * 0.8,
          height: MediaQuery.sizeOf(context).height * 1,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}






/* import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Divider()),
            Text(
              "Sign in with",
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            Expanded(child: Divider()),
          ],
        ),


        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            // Google icon
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                  size: 28,
                ),
              ),
            ),

            // Facebook icon
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blueAccent,
                  size: 28,
                ),
              ),
            ),

            // X (Twitter) icon
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const FaIcon(
                  FontAwesomeIcons.xTwitter,
                  color: Colors.black,
                  size: 26,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
} */