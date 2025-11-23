import 'package:flutter/material.dart';

import '../widgets/contact_item.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Contacts"), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            child: ContactItem(),
          ),
        ],
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Contacts"), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Jam Clinic",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "No 53, Abimbola Crescent, FCT, Abuja",
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            spacing: 24,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.call, color: Colors.green, size: 40),
                              Icon(
                                Icons.message,
                                color: Colors.blueAccent,
                                size: 40,
                              ),
                            ],
                          ),
                          SizedBox(height: 24,),
                          Text(
                            "History",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text("No history yet!",
                            textAlign: TextAlign.center,),
                        ],
                      ),
                    );
                  },
                );
              },
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.add_box_outlined),
              ),
              title: Text(
                "Clinic name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("12th November, 2025"),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Contact page"),);
  }
} */