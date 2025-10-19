import 'package:my_newapp/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int activeIndex = 0;

  List<OnboardingItem> items = [
    OnboardingItem(
      title: "Welcome to MediCall",
      subtitle:
          "We help you make ambulance requests for emergency and other purposes",
      asset: "assets/pngtree-ambulance-emergency with red location.png",   //Another image but its jpg...assets/ambulance-design with label_24908-54589.jpg"
    ),
    OnboardingItem(
      title: "Get emergency medical help fast ",
      subtitle:
          "wherever you are. Need urgent help? We’ll connect you to the nearest available ambulance.",
      asset: "assets/pngtree-ambulance-emergency with red location.png",
    ),
    OnboardingItem(
      title: "Meet world class respondents",
      subtitle:
          "wherever you are. Need urgent help? We’ll connect you to world class respondents",
      asset: "assets/pngtree-ambulance-emergency with red location.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var onboardingItemToShow = items[activeIndex];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          CustomIndicator(indicatorCount: items.length, activeIndex: activeIndex),
          Image.asset(onboardingItemToShow.asset, width: 300, height: 300),
          Text(
            onboardingItemToShow.title,
            style: GoogleFonts.aDLaMDisplay(
              fontWeight: FontWeight.w600,
              fontSize: 32,
            ),
            textAlign: TextAlign.center
          ),
          Text(
            onboardingItemToShow.subtitle,
            style: GoogleFonts.k2d(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            activeIndex <= 0
                ? SizedBox(height: 0, width: 0)
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        activeIndex = activeIndex - 1;
                      });
                    },
                    child: Text("Back"),
                  ),
            ElevatedButton(
              onPressed: () {
                if (activeIndex < items.length - 1) {
                  setState(() {
                    activeIndex = activeIndex + 1;
                  });
                } else {
                  Navigator.of(context).pushReplacementNamed("/login");
                }
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem {
  String title;
  String subtitle;
  String asset;

  OnboardingItem({
    required this.title,
    required this.subtitle,
    required this.asset,
  });
}