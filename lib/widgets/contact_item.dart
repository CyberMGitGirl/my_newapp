import 'package:flutter/material.dart';


class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
                    "No 53, Idu Crescent, FCT",
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
      subtitle: Text("12th of November, 2025"),
    );
  }
}